package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.error.CamposDuplicadosException;
import com.recreadejuerga.recrea.error.EquipoNoEncontradoException;
import com.recreadejuerga.recrea.error.EquipoYaExistenteException;
import com.recreadejuerga.recrea.repositorios.EquipoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Service
public class EquipoServicio {

    @Autowired
    private EquipoRepositorio repo;

    public List<Equipo> getEquipos(){
        List<Equipo> resultado= repo.findAll();
        if(resultado.isEmpty())
            throw new EquipoNoEncontradoException();
        return resultado;
    }

    public Equipo getEquipo(UUID id){
        return repo.findById(id).orElseThrow(() -> new EquipoNoEncontradoException(id));
    }

    public Equipo insertarEquipo(Equipo e) {
        if (repo.buscarPorNombre(e.getNombre()).isPresent())
            throw new EquipoYaExistenteException(e.getNombre());
        try {
            return repo.save(e);
        } catch (DataIntegrityViolationException ex) {
            Throwable causa = ex.getRootCause();
            if (causa != null) {
                String mensaje = causa.getMessage();
                if (mensaje.contains("uk_equipo_nombre")) {
                    throw new CamposDuplicadosException(Map.of(
                            "nombre", "Ya existe un equipo con ese nombre(+"+e.getNombre()+")"
                    ));
                }
            }
            throw new CamposDuplicadosException(Map.of(
                    "desconocido", "Violación de restricción de unicidad"
            ));
        }
    }


    public Equipo modificarEquipo(Equipo e, UUID id){
        if(repo.existsById(id)){
            try {
                repo.actualizarEquipo(id, e.getNombre(), e.getUrl_logo());
                return repo.findById(id).orElseThrow(()-> new EquipoNoEncontradoException(id));
            }catch (DataIntegrityViolationException ex){
                Throwable causa = ex.getRootCause();
                if (causa != null) {
                    String mensaje = causa.getMessage();
                    if (mensaje.contains("uk_equipo_nombre")) {
                        throw new CamposDuplicadosException(Map.of(
                                "nombre", "Ya existe un equipo con ese nombre("+e.getNombre()+")"
                        ));
                    }
                }
                throw new CamposDuplicadosException(Map.of(
                        "desconocido", "Violación de restricción de unicidad"
                ));
            }
        }else{
            throw new EquipoNoEncontradoException(id);
        }
    }

    public boolean eliminarEquipo(UUID id){
        if(repo.existsById(id)){
            repo.eliminarEquipo(id);
            return true;
        }else{
            throw new EquipoNoEncontradoException(id);
        }
    }
}
