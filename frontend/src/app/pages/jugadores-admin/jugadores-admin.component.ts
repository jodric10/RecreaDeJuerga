import { Component, inject, OnInit } from '@angular/core';
import { JugadorDTO } from '../../models/jugador/jugador';
import { JugadorService } from '../../services/jugador/jugador.service';
import { EquipoService } from '../../services/equipo/equipo.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { take } from 'rxjs';
import { EquipoDTO } from '../../models/equipo/equipo';
import { HttpErrorResponse } from '@angular/common/http';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { DrawerComponent } from '../../components/drawer/drawer.component';
import { JugadorFormularioDTO } from '../../models/jugador/jugadorFormulario';

@Component({
  selector: 'app-jugadores-admin',
  imports: [ReactiveFormsModule, DrawerComponent],
  templateUrl: './jugadores-admin.component.html',
  styleUrl: './jugadores-admin.component.css',
})
export class JugadoresAdminComponent implements OnInit {
  private equipoService = inject(EquipoService);
  private jugadorService = inject(JugadorService);
  private route = inject(ActivatedRoute);
  private toastService = inject(ToastService);
  private router = inject(Router);

  mostrarDrawer: boolean = false;
  formularioJugador: FormGroup | null = null;
  editando: boolean = false;
  jugadorId: string = '';
  nombreEquipo: string = '';
  jugadores: JugadorDTO[] | null = null;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');
    this.cargarJugadores();
    this.formularioJugador = new FormGroup({
      nombre: new FormControl('', [
        Validators.required,
        Validators.maxLength(255),
      ]),
      apodo: new FormControl(''),
      dorsal: new FormControl(null, [Validators.required, Validators.min(1)]),
      posicion: new FormControl(''),
      pieDominante: new FormControl(''),
      golesTotales: new FormControl(0, [Validators.min(0)]),
      asistenciasTotales: new FormControl(0, [Validators.min(0)]),
      fortalezas: new FormControl(''),
      fechaNacimiento: new FormControl(null),
      equipoId: new FormControl(null, [Validators.required]),
      cromo: new FormControl(''),
      fotoPose: new FormControl(''),
      num_coleccionable: new FormControl(0, [Validators.min(0)]),
    });
  }

  navegarA(jugadorId: string) {
    this.router.navigate([jugadorId,'parecidos'], { relativeTo: this.route });
  }

  resetearFormulario(): void {
    this.formularioJugador?.reset();
  }

  editarJugador(jugador: JugadorDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.editando = true;
    this.jugadorId = jugador.id;
    this.mostrarDrawer = true;
    this.formularioJugador?.patchValue({
      nombre: jugador.nombre,
      apodo: jugador.apodo,
      dorsal: jugador.dorsal,
      posicion: jugador.posicion,
      pieDominante: jugador.pieDominante,
      golesTotales: jugador.golesTotales,
      asistenciasTotales: jugador.asistenciasTotales,
      fortalezas: jugador.fortalezas,
      fechaNacimiento: jugador.fechaNacimiento,
      equipoId: jugador.equipo.id,
      cromo: jugador.cromo,
      fotoPose: jugador.fotoPose,
      num_coleccionable: jugador.num_coleccionable,
    });
  }

  eliminarJugador(jugador: JugadorDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.jugadorService.eliminarJugador(jugador.id).subscribe({
      next: () => {
        this.toastService.show({
          severity: 'success',
          summary: 'Jugador eliminado',
          detail: `Se ha eliminado el jugador ${jugador.nombre} correctamente.`,
        });
        this.jugadorService.clearJugadoresCache();
        this.cargarJugadores();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al eliminar el jugador',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  volver() {
    this.router.navigate(['app','admin',this.nombreEquipo.replace(/ /g, '_'),'menu']);
  }

  onSubmit(): void {
    const datosJugador: JugadorFormularioDTO = this.formularioJugador
      ?.value as JugadorFormularioDTO;

    if (this.editando && this.jugadorId != null) {
      this.jugadorService
        .editarJugador(this.jugadorId, datosJugador)
        .subscribe({
          next: (jugador: JugadorDTO) => {
            this.toastService.show({
              severity: 'success',
              summary: 'Jugador actualizado',
              detail: 'Se ha actualizado correctamente.',
            });
            this.resetearFormulario();
            this.mostrarDrawer = false;
            this.jugadorService.clearJugadoresCache();
            this.cargarJugadores();
          },
          error: (err: HttpErrorResponse) => {
            this.toastService.show({
              severity: 'error',
              summary: 'Error al actualizar el jugador',
              detail: err.error?.detail || 'Error inesperado.',
            });
          },
        });
    } else {
      this.jugadorService.altaJugador(datosJugador).subscribe({
        next: (jugador: JugadorDTO) => {
          this.toastService.show({
            severity: 'success',
            summary: 'Jugador creado',
            detail: 'Se ha creado correctamente.',
          });
          this.resetearFormulario();
          this.mostrarDrawer = false;
          this.jugadorService.clearJugadoresCache();
          this.cargarJugadores();
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al crear el jugador',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
    }
  }

  cargarJugadores() {
    this.equipoService
      .getEquipoPorNombre(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (equipo: EquipoDTO) => {
          this.jugadorService
            .getJugadoresDeUnEquipo(equipo.id)
            .pipe(take(1))
            .subscribe({
              next: (jugadores: JugadorDTO[]) => {
                this.jugadores = jugadores;
              },
              error: (err: HttpErrorResponse) => {
                this.toastService.show({
                  severity: 'error',
                  summary: 'Error al obtener jugadores',
                  detail: err.error?.detail || 'Error inesperado.',
                });
              },
            });
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al obtener el equipo',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }
}
