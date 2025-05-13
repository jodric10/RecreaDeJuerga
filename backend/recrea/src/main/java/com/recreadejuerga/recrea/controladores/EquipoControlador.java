package com.recreadejuerga.recrea.controladores;

import com.recreadejuerga.recrea.entidades.Equipo;
import com.recreadejuerga.recrea.repositorios.EquipoRepositorio;
import com.recreadejuerga.recrea.servicios.EquipoServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/equipos")
public class EquipoControlador {

    @Autowired
    private EquipoServicio equipoServicio;

    @GetMapping
    public ResponseEntity<List<Equipo>> getEquipos(){
        List<Equipo> equipos= equipoServicio.getEquipos();
        return ResponseEntity.ok(equipos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Equipo> getEquipoById(@PathVariable UUID id){
        return ResponseEntity.ok(equipoServicio.getEquipo(id));
    }

    @PostMapping("/alta")
    public ResponseEntity<Equipo> crear(@RequestBody Equipo equipo) {
        return ResponseEntity.status(HttpStatus.CREATED).body(equipoServicio.insertarEquipo(equipo));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Equipo> editar(@RequestBody Equipo equipo, @PathVariable UUID id){
        return ResponseEntity.of(equipoServicio.modificarEquipo(equipo,id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@PathVariable UUID id){
        equipoServicio.eliminarEquipo(id);
        return ResponseEntity.noContent().build();
    }


}
