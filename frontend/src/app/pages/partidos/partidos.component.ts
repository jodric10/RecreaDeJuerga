import { Component, inject, OnInit } from '@angular/core';
import { CeldaPartidoComponent } from '../../components/celda-partido/celda-partido.component';
import { PartidoDTO } from '../../models/partido/partido';
import { PartidoService } from '../../services/partido/partido.service';
import { ActivatedRoute } from '@angular/router';
import { EquipoService } from '../../services/equipo/equipo.service';
import { take } from 'rxjs';
import { EquipoDTO } from '../../models/equipo/equipo';
import { HttpErrorResponse } from '@angular/common/http';
import { ToastService } from '../../services/toastMessage/toast.service';

@Component({
  selector: 'app-partidos',
  standalone: true,
  imports: [CeldaPartidoComponent],
  templateUrl: './partidos.component.html',
  styleUrl: './partidos.component.css',
})
export class PartidosComponent implements OnInit {
  partidosEquipo: PartidoDTO[] = [];
  private route = inject(ActivatedRoute);
  private partidoService = inject(PartidoService);
  private equipoService = inject(EquipoService);
  private toastService= inject(ToastService);
  nombreEquipo: string = '';
  equipo: EquipoDTO | undefined;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');

    this.equipoService
      .getEquipoPorNombre(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (equipo: EquipoDTO) => {
          this.cargarPartidos(equipo);
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener el equipo',
            detail: err.error?.detail || 'Ha ocurrido un error inesperado.',
          });
        },
      });
  }

  private cargarPartidos(equipo: EquipoDTO): void {
    this.equipo = equipo;

    this.partidoService
      .getPartidosDeUnEquipo(equipo.id)
      .pipe(take(1))
      .subscribe({
        next: (partidos:PartidoDTO[]) => {
          this.partidosEquipo = partidos;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener los partidos',
            detail: err.error?.detail || 'Ha ocurrido un error inesperado.',
          });
        },
      });
  }
}
