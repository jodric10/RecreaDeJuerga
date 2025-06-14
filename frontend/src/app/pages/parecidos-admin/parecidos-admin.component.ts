import { Component, inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { DrawerComponent } from '../../components/drawer/drawer.component';
import { ParecidoService } from '../../services/parecido/parecido.service';
import { JugadorService } from '../../services/jugador/jugador.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { take } from 'rxjs';
import { JugadorDTO } from '../../models/jugador/jugador';
import { JugadorParecidoDTO } from '../../models/parecido/jugadorParecido';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-parecidos-admin',
  imports: [ReactiveFormsModule, DrawerComponent],
  templateUrl: './parecidos-admin.component.html',
  styleUrl: './parecidos-admin.component.css',
})
export class ParecidosAdminComponent implements OnInit {
  private parecidoService = inject(ParecidoService);
  private jugadorService = inject(JugadorService);
  private route = inject(ActivatedRoute);
  private toastService = inject(ToastService);
  private router = inject(Router);
  jugadorId: string = '';
  jugador: JugadorDTO | null = null;
  parecidos: JugadorParecidoDTO[] = [];
  mostrarDrawer: boolean = false;
  editando: boolean = false;
  formularioParecido: FormGroup | null = null;
  nombreEquipo: string = '';
  parecidoId: string='';

  ngOnInit(): void {
    this.nombreEquipo = this.route.snapshot.params['nombreEquipo'];
    this.jugadorId = this.route.snapshot.params['jugadorId'];
    this.jugadorService
      .getJugador(this.jugadorId)
      .pipe(take(1))
      .subscribe({
        next: (jugador: JugadorDTO) => {
          this.jugador = jugador;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al recuperar el jugador',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
    this.cargarParecidos();
    this.formularioParecido = new FormGroup({
      parecido: new FormControl(''),
    });
  }

  resetearFormulario() {
    this.formularioParecido?.reset();
  }

  eliminarParecido(parecidoId: string): void {
    this.parecidoService.eliminarParecido(parecidoId).subscribe({
      next: () => {
        this.toastService.show({
          severity: 'success',
          summary: 'Parecido eliminado',
          detail: `Se ha eliminado el parecido correctamente.`,
        });
        this.cargarParecidos();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al eliminar el parecido',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  editarParecido(parecido: JugadorParecidoDTO): void {
    this.editando = true;
    this.parecidoId = parecido.id;
    this.mostrarDrawer = true;
    this.formularioParecido?.patchValue({
      parecido: parecido.parecido,
    });
  }

  volver() {
    this.router.navigate([
      'app',
      'admin',
      this.nombreEquipo,
      'menu',
      'jugadores',
    ]);
  }

  onSubmit(): void {
    const datosParecido: JugadorParecidoDTO = this.formularioParecido
      ?.value as JugadorParecidoDTO;

    if (this.editando && this.parecidoId != null) {
      this.parecidoService
        .editarParecido(this.parecidoId, datosParecido)
        .subscribe({
          next: () => {
            this.toastService.show({
              severity: 'success',
              summary: 'Parecido actualizado',
              detail: 'Se ha actualizado correctamente.',
            });
            this.resetearFormulario();
            this.mostrarDrawer = false;
            this.cargarParecidos();
          },
          error: (err: HttpErrorResponse) => {
            this.toastService.show({
              severity: 'error',
              summary: 'Error al actualizar el parecido',
              detail: err.error?.detail || 'Error inesperado.',
            });
          },
        });
    } else {
      this.parecidoService
        .altaParecido(datosParecido, this.jugadorId)
        .subscribe({
          next: () => {
            this.toastService.show({
              severity: 'success',
              summary: 'Parecido añadido',
              detail: 'Se ha añadido correctamente.',
            });
            this.resetearFormulario();
            this.mostrarDrawer = false;
            this.cargarParecidos();
          },
          error: (err: HttpErrorResponse) => {
            this.toastService.show({
              severity: 'error',
              summary: 'Error al añadir el parecido',
              detail: err.error?.detail || 'Error inesperado.',
            });
          },
        });
    }
  }

  cargarParecidos(): void {
    this.parecidoService
      .getParecidosDeUnJugador(this.jugadorId)
      .pipe(take(1))
      .subscribe({
        next: (parecidos: JugadorParecidoDTO[]) => {
          this.parecidos = parecidos;
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al recuperar los parecidos',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }
}
