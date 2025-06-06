import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PartidoService } from '../../services/partido/partido.service';
import { EstadisticasJugadorService } from '../../services/estadisticas/estadisticas-jugador.service';
import { EstadisticasJugadorPartidoDTO } from '../../models/estadisticas/estadisticasJugadorPartido';
import { PartidoDTO } from '../../models/partido/partido';
import { take } from 'rxjs';
import { ToastService } from '../../services/toastMessage/toast.service';
import { CommonModule } from '@angular/common';
import { CapitalizarFechaPipe } from "../../pipes/capitalizar-fecha.pipe";

@Component({
  selector: 'app-estadisticas',
  imports: [CommonModule, CapitalizarFechaPipe],
  templateUrl: './estadisticas.component.html',
  styleUrl: './estadisticas.component.css',
})
export class EstadisticasComponent implements OnInit {
  private route = inject(ActivatedRoute);
  private partidoService = inject(PartidoService);
  private estadisticaService = inject(EstadisticasJugadorService);
  estadisticasJugadores: EstadisticasJugadorPartidoDTO[] = [];
  private toastService = inject(ToastService);
  datosPartido: PartidoDTO | null = null;

  ngOnInit(): void {
    this.datosPartido = history.state.partido;
    if (this.datosPartido != null) {
      console.log('Desde state:', this.datosPartido.id);
      this.getEstadisticasPartidoJugadores(this.datosPartido.id);
    } else {
      const partidoId = this.route.snapshot.params['partidoId'];
      console.log('Desde state:', partidoId);
      this.partidoService
        .getPartidosById(partidoId)
        .pipe(take(1))
        .subscribe({
          next: (equipo: PartidoDTO) => {
            this.datosPartido = equipo;
            this.getEstadisticasPartidoJugadores(this.datosPartido.id);
          },
        });
    }
  }

  getEstadisticasPartidoJugadores(partidoId: string) {
    this.estadisticaService
      .getEstadisticasPorPartido(partidoId)
      .pipe(take(1))
      .subscribe({
        next: (estadisticas: EstadisticasJugadorPartidoDTO[]) => {
          this.estadisticasJugadores = estadisticas;
          console.log(this.estadisticasJugadores);
        },
        error: (err) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener los equipos',
            detail: err.error?.detail || 'Ha ocurrido un error inesperado.',
          });
        },
      });
  }
}
