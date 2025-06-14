import { Component, inject, OnInit } from '@angular/core';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { DrawerComponent } from '../../components/drawer/drawer.component';
import { PartidoService } from '../../services/partido/partido.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { EstadisticasJugadorService } from '../../services/estadisticas/estadisticas-jugador.service';
import { EstadisticasJugadorPartidoDTO } from '../../models/estadisticas/estadisticasJugadorPartido';
import { take } from 'rxjs';
import { PartidoDTO } from '../../models/partido/partido';
import { HttpErrorResponse } from '@angular/common/http';
import { EstadisticasJugadorPartidoActualizarDTO } from '../../models/estadisticas/estadisticasJugadorPartidoActualizar';
import { EstadisticasJugadorPartidoInsertarDTO } from '../../models/estadisticas/estadisticasJugadorPartidoInsertar';

@Component({
  selector: 'app-estadisticas-jugadores-admin',
  imports: [ReactiveFormsModule, DrawerComponent],
  templateUrl: './estadisticas-jugadores-admin.component.html',
  styleUrl: './estadisticas-jugadores-admin.component.css',
})
export class EstadisticasJugadoresAdminComponent implements OnInit {
  private partidoService = inject(PartidoService);
  private estadisticaService = inject(EstadisticasJugadorService);
  private route = inject(ActivatedRoute);
  private toastService = inject(ToastService);
  private router = inject(Router);

  mostrarDrawer: boolean = false;
  formularioInsertarEstadisticas: FormGroup | null = null;
  formularioActualizarEstadisticas: FormGroup | null = null;
  partidoId: string = '';
  estadisticasJugadoresPartido: EstadisticasJugadorPartidoDTO[] = [];
  editando: boolean = false;
  partido: PartidoDTO | null = null;
  nombreEquipo: string = '';
  estadisticaId: string = '';

  ngOnInit(): void {
    this.partidoId = this.route.snapshot.params['partidoId'];
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');
    this.partidoService
      .getPartidosById(this.partidoId)
      .pipe(take(1))
      .subscribe({
        next: (partido: PartidoDTO) => {
          this.partido = partido;
        },
      });
    this.cargarEstadisticasJugadoresPartido();
    this.formularioInsertarEstadisticas = this.crearFormularioInsertar();
    this.formularioActualizarEstadisticas = this.crearFormularioActualizar();
  }

  eliminarEstadisticaDeJugador(
    estaditica: EstadisticasJugadorPartidoDTO
  ): void {
    this.estadisticaService.eliminarEstadistica(estaditica.id).subscribe({
      next: () => {
        this.toastService.show({
          severity: 'success',
          summary: 'Estadistica eliminada exitosamente',
          detail: `Se ha eliminado la estadística del juagdor en este partido correctamente.`,
        });
        this.cargarEstadisticasJugadoresPartido();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al eliminar la estadística',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  editarEstadisticaDelJugador(
    estadistica: EstadisticasJugadorPartidoDTO
  ): void {
    this.editando = true;
    this.estadisticaId = estadistica.id;
    this.mostrarDrawer = true;
    this.formularioActualizarEstadisticas?.patchValue({
      goles: estadistica.goles,
      asistencias: estadistica.asistencias,
      amarilla: estadistica.amarilla,
      roja: estadistica.roja,
      portero: estadistica.portero,
    });
  }

  volver() {
    this.router.navigate([
      'app',
      'admin',
      this.nombreEquipo.replace(/ /g, '_'),
      'menu',
      'partidos',
    ]);
  }

  resetearFormulario(editando: boolean): void {
    if (editando) {
      this.formularioActualizarEstadisticas?.reset();
    } else {
      this.formularioInsertarEstadisticas?.reset();
    }
  }

  crearFormularioInsertar(): FormGroup {
    return new FormGroup({
      jugadorId: new FormControl('', [Validators.required]),
      partidoId: new FormControl('', [Validators.required]),
      goles: new FormControl(0, [Validators.required, Validators.min(0)]),
      asistencias: new FormControl(0, [Validators.required, Validators.min(0)]),
      amarilla: new FormControl(false),
      roja: new FormControl(false),
      portero: new FormControl(false),
    });
  }

  crearFormularioActualizar(): FormGroup {
    return new FormGroup({
      goles: new FormControl(0, [Validators.required, Validators.min(0)]),
      asistencias: new FormControl(0, [Validators.required, Validators.min(0)]),
      amarilla: new FormControl(false),
      roja: new FormControl(false),
      portero: new FormControl(false),
    });
  }

  cargarEstadisticasJugadoresPartido(): void {
    this.estadisticaService
      .getEstadisticasPorPartido(this.partidoId)
      .pipe(take(1))
      .subscribe({
        next: (estadisticas: EstadisticasJugadorPartidoDTO[]) => {
          this.estadisticasJugadoresPartido = estadisticas;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: `Error al obtener las estadisticas del partido`,
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }

  onSubmit(): void {
    if (this.editando && this.estadisticaId != null) {
      const datosEstadisticaJugador: EstadisticasJugadorPartidoActualizarDTO =
        this.formularioActualizarEstadisticas
          ?.value as EstadisticasJugadorPartidoActualizarDTO;
      this.estadisticaService
        .editarEquipoeditarEstadistica(this.estadisticaId, datosEstadisticaJugador)
        .subscribe({
          next: (estadistica: EstadisticasJugadorPartidoDTO) => {
            this.toastService.show({
              severity: 'success',
              summary: 'Estadística del jugador actualizada',
              detail: 'Se ha actualizado correctamente.',
            });
            this.resetearFormulario(this.editando);
            this.mostrarDrawer = false;
            this.cargarEstadisticasJugadoresPartido();
          },
          error: (err: HttpErrorResponse) => {
            this.toastService.show({
              severity: 'error',
              summary: 'Error al actualizar la estadística del jugador',
              detail: err.error?.detail || 'Error inesperado.',
            });
          },
        });
    } else {
      const datosEstadisticaJugador: EstadisticasJugadorPartidoInsertarDTO =
        this.formularioInsertarEstadisticas
          ?.value as EstadisticasJugadorPartidoInsertarDTO;
      this.estadisticaService.altaEstadistica(datosEstadisticaJugador).subscribe({
        next: (estadistica: EstadisticasJugadorPartidoDTO) => {
          this.toastService.show({
            severity: 'success',
            summary: 'Estadística creada con éxito',
            detail: 'Se ha creado correctamente.',
          });
          this.resetearFormulario(this.editando);
          this.mostrarDrawer = false;
          this.cargarEstadisticasJugadoresPartido();
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al crear la estadística del jugador',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
    }
  }
}
