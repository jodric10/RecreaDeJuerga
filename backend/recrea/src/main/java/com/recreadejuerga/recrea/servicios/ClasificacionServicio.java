package com.recreadejuerga.recrea.servicios;

import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionDTO;
import com.recreadejuerga.recrea.dtos.clasificacion.ClasificacionEditarDTO;
import com.recreadejuerga.recrea.error.ClasificacionNoEncontradaException;
import com.recreadejuerga.recrea.error.EquipoNoEncontradoException;
import com.recreadejuerga.recrea.mappers.ClasificacionMapper;
import com.recreadejuerga.recrea.repositorios.ClasificacionRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.UUID;

@Service
public class ClasificacionServicio {

    private BigDecimal calcularPromedioTfTc(Integer golesAFavor, Integer golesContra){
        if(golesContra==0){
            return null;
        }
        return BigDecimal.valueOf(golesAFavor).divide(BigDecimal.valueOf(golesContra),2, RoundingMode.HALF_UP);
    }

    @Autowired
    ClasificacionRepositorio repo;

    public List<ClasificacionDTO> getClasificacion(){
        List<ClasificacionDTO> clasificacion= repo.findAll(Sort.by(Sort.Direction.DESC,"puntos")).stream().map(ClasificacionMapper::toClasificacionDTO).toList();
        if(clasificacion.isEmpty()){
            throw new ClasificacionNoEncontradaException();
        }
        return clasificacion;
    }

    public ClasificacionDTO modificarClasificacion(ClasificacionEditarDTO c, UUID id) {
        if (repo.existsById(id)) {
            Integer diferenciaGoles= c.getGolesAFavor()-c.getGolesContra();
            BigDecimal promedioTfTc= calcularPromedioTfTc(c.getGolesAFavor(),c.getGolesContra());
            repo.actualizarClasificacion(id, c.getPuntos(), c.getPartidosJugados(), c.getGanados(), c.getEmpatados(), c.getPerdidos(), c.getGolesAFavor(), c.getGolesContra(),diferenciaGoles, promedioTfTc);
            return repo.findById(id).map(ClasificacionMapper::toClasificacionDTO).orElseThrow(() -> new ClasificacionNoEncontradaException(id));
        } else {
            throw new EquipoNoEncontradoException(id);
        }
    }
}
