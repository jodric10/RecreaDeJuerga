import {
  Component,
  CUSTOM_ELEMENTS_SCHEMA,
  inject,
  OnInit,
} from '@angular/core';
import { PartidoService } from '../../services/partido/partido.service';
import { EquipoService } from '../../services/equipo/equipo.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import {
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { DrawerComponent } from '../../components/drawer/drawer.component';
import { PartidoDTO } from '../../models/partido/partido';
import { take } from 'rxjs';
import { EquipoDTO } from '../../models/equipo/equipo';
import { HttpErrorResponse } from '@angular/common/http';
import { PartidoFormularioDTO } from '../../models/partido/partidoFormulario';
import { register } from 'swiper/element';
import SwiperCore from 'swiper';
import { Navigation, Pagination } from 'swiper/modules';

register();

SwiperCore.use([Pagination, Navigation]);

@Component({
  selector: 'app-partidos-admin',
  imports: [ReactiveFormsModule, DrawerComponent],
  templateUrl: './partidos-admin.component.html',
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  styleUrl: './partidos-admin.component.css',
})
export class PartidosAdminComponent implements OnInit {
  private equipoService = inject(EquipoService);
  private partidoService = inject(PartidoService);
  private route = inject(ActivatedRoute);
  private toastService = inject(ToastService);
  private router = inject(Router);

  mostrarDrawer: boolean = false;
  formularioPartido: FormGroup | null = null;
  editando: boolean = false;
  partidoId: string = '';
  nombreEquipo: string = '';
  partidos: PartidoDTO[]=[];
  swiperInstance: SwiperCore | null = null;
  paginaActual = 0;
  pageSize = 9;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');
    this.cargarPartidos();
    this.formularioPartido = new FormGroup({
      fecha: new FormControl('', [Validators.required]),
      lugar: new FormControl('', [
        Validators.required,
        Validators.maxLength(100),
      ]),
      estado: new FormControl('', [
        Validators.required,
        Validators.maxLength(20),
      ]),
      equipoLocalId: new FormControl('', [Validators.required]),
      equipoVisitanteId: new FormControl('', [Validators.required]),
      golesLocal: new FormControl(''),
      golesVisitante: new FormControl(''),
      mvpId: new FormControl(''),
    });
  }

  partidosPorPagina(): any[][] {
    const pageSize = 9;
    const grupos: any[][] = [];

    for (let i = 0; i < this.partidos!.length; i += pageSize) {
      grupos.push(this.partidos!.slice(i, i + pageSize));
    }

    return grupos;
  }

  getIndiceGlobal(indexLocal: number): number {
    return this.paginaActual * this.pageSize + indexLocal + 1;
  }

  onSwiperInit(event: any) {
    this.swiperInstance = event.detail[0];

    this.swiperInstance!.on('slideChange', () => {
      this.paginaActual = this.swiperInstance!.activeIndex;
    });
  }
  paginaSiguiente() {
    this.swiperInstance?.slideNext();
  }

  paginaAnterior() {
    this.swiperInstance?.slidePrev();
  }

  totalFinalizados(): number {
    return this.partidos?.filter((p) => p.estado === 'Finalizado').length ?? 0;
  }

  navegarA(partidoId: string) {
    this.router.navigate([partidoId, 'estadisticas-jugadores'], { relativeTo: this.route });
  }

  resetearFormulario(): void {
    this.formularioPartido?.reset();
  }

  editarPartido(partido: PartidoDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.editando = true;
    this.partidoId = partido.id;
    this.mostrarDrawer = true;
    this.formularioPartido?.patchValue({
      fecha: partido.fecha,
      lugar: partido.lugar,
      estado: partido.estado,
      equipoLocalId: partido.equipoLocal.id,
      equipoVisitanteId: partido.equipoVisitante.id,
      golesLocal: partido.golesLocal,
      golesVisitante: partido.golesVisitante,
      mvpId: partido.mvp.id,
    });
  }

  eliminarPartido(partido: PartidoDTO, event: MouseEvent): void {
    event.stopPropagation();
    this.partidoService.eliminarPartido(partido.id).subscribe({
      next: () => {
        this.toastService.show({
          severity: 'success',
          summary: 'Partido eliminado',
          detail: `Se ha eliminado el partido correctamente.`,
        });
        this.cargarPartidos();
      },
      error: (err: HttpErrorResponse) => {
        this.toastService.show({
          severity: 'error',
          summary: 'Error al eliminar el partido',
          detail: err.error?.detail || 'Error inesperado.',
        });
      },
    });
  }

  volver() {
    this.router.navigate([
      'app',
      'admin',
      this.nombreEquipo.replace(/ /g, '_'),
      'menu',
    ]);
  }

  onSubmit(): void {
    const datosPartido: PartidoFormularioDTO = this.formularioPartido
      ?.value as PartidoFormularioDTO;

    if (this.editando && this.partidoId != null) {
      this.partidoService
        .editarPartido(this.partidoId, datosPartido)
        .subscribe({
          next: (partido: PartidoDTO) => {
            this.toastService.show({
              severity: 'success',
              summary: 'Partido actualizado',
              detail: 'Se ha actualizado correctamente.',
            });
            this.resetearFormulario();
            this.mostrarDrawer = false;
            this.cargarPartidos();
          },
          error: (err: HttpErrorResponse) => {
            this.toastService.show({
              severity: 'error',
              summary: 'Error al actualizar el partido',
              detail: err.error?.detail || 'Error inesperado.',
            });
          },
        });
    } else {
      this.partidoService.altaPartido(datosPartido).subscribe({
        next: (partido: PartidoDTO) => {
          this.toastService.show({
            severity: 'success',
            summary: 'Partido creado',
            detail: 'Se ha creado correctamente.',
          });
          this.resetearFormulario();
          this.mostrarDrawer = false;
          this.cargarPartidos();
        },
        error: (err: HttpErrorResponse) => {
          this.toastService.show({
            severity: 'error',
            summary: 'Error al crear el partido',
            detail: err.error?.detail || 'Error inesperado.',
          });
        },
      });
    }
  }

  cargarPartidos() {
    this.equipoService
      .getEquipoPorNombre(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (equipo: EquipoDTO) => {
          this.partidoService
            .getPartidosDeUnEquipo(equipo.id)
            .pipe(take(1))
            .subscribe({
              next: (partidos: PartidoDTO[]) => {
                this.partidos = partidos;
              },
              error: (err: HttpErrorResponse) => {
                this.toastService.show({
                  severity: 'error',
                  summary: `Error al obtener los partidos de ${equipo.nombre}`,
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
