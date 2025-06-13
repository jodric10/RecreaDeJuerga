import {
  Component,
  OnInit,
  ViewChild,
  AfterViewInit,
  inject,
  CUSTOM_ELEMENTS_SCHEMA,
  OnDestroy,
} from '@angular/core';
import { ActivatedRoute, Router, RouterOutlet } from '@angular/router';
import { JugadorService } from '../../services/jugador/jugador.service';
import { ToastService } from '../../services/toastMessage/toast.service';
import { EquipoService } from '../../services/equipo/equipo.service';
import { filter, Subject, take, takeUntil } from 'rxjs';
import { JugadorDTO } from '../../models/jugador/jugador';
import { EquipoDTO } from '../../models/equipo/equipo';
import { HttpErrorResponse } from '@angular/common/http';
import { CromoComponent } from '../../components/cromo/cromo.component';
import { CommonModule } from '@angular/common';
import { register } from 'swiper/element/bundle';

register();

@Component({
  selector: 'app-jugadores',
  standalone: true,
  imports: [CromoComponent, RouterOutlet, CommonModule],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  templateUrl: './jugadores.component.html',
  styleUrl: './jugadores.component.css',
})
export class JugadoresComponent implements OnInit, OnDestroy {
  private equipoService = inject(EquipoService);
  private jugadorService = inject(JugadorService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private toastService = inject(ToastService);
  private destroy$ = new Subject<void>();

  @ViewChild(RouterOutlet) outlet!: RouterOutlet;

  jugadores: JugadorDTO[] = [];
  nombreEquipo: string = '';
  jugadorSeleccionado: JugadorDTO | null = null;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');

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
                this.jugadores = jugadores.filter((j) => j.cromo != null);
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
            summary: 'Error al obtener equipo',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });

    this.jugadorService.jugadorSeleccionado$
      .pipe(
        filter((jugador): jugador is JugadorDTO => jugador !== null),
        takeUntil(this.destroy$)
      )
      .subscribe({
        next: (jugadorSeleccionado: JugadorDTO) => {
          this.jugadorSeleccionado = jugadorSeleccionado;
          console.log('Jugador actualizado:', jugadorSeleccionado);
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al recibir el jugador seleccionado',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  detallesJugador(id: string) {
    const nombreEquipoURL = this.nombreEquipo.replace(/ /g, '_');
    this.router.navigate(['app', nombreEquipoURL, 'jugadores', id]);
  }

  dividirEnPaginas(lista: JugadorDTO[], tamano: number): JugadorDTO[][] {
    const resultado: JugadorDTO[][] = [];
    for (let i = 0; i < lista.length; i += tamano) {
      resultado.push(lista.slice(i, i + tamano));
    }
    return resultado;
  }
}
