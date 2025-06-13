import {
  Component,
  CUSTOM_ELEMENTS_SCHEMA,
  inject,
  OnInit,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastService } from '../../services/toastMessage/toast.service';
import { FooterComponent } from '../../components/footer/footer.component';
import { EquipoService } from '../../services/equipo/equipo.service';
import { ContadorComponent } from '../../components/contador/contador.component';
import { TarjetaEquipoComponent } from '../../components/tarjeta-equipo/tarjeta-equipo.component';
import { EquipoDTO } from '../../models/equipo/equipo';
import { take } from 'rxjs';
import { HttpErrorResponse } from '@angular/common/http';
import { ValorEquipo } from '../../models/valorEquipo';
import { TarjetaValorComponent } from '../../components/tarjeta-valor/tarjeta-valor.component';
import { CromoComponent } from '../../components/cromo/cromo.component';
import { JugadorDTO } from '../../models/jugador/jugador';
import { JugadorService } from '../../services/jugador/jugador.service';
import { register } from 'swiper/element/bundle';
import SwiperCore from 'swiper';
import { EffectCards } from 'swiper/modules';

register();

SwiperCore.use([EffectCards]);

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    FooterComponent,
    ContadorComponent,
    TarjetaEquipoComponent,
    TarjetaValorComponent,
    CromoComponent,
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
})
export class HomeComponent implements OnInit {
  private equipoService = inject(EquipoService);
  private jugadorService = inject(JugadorService);
  private router = inject(Router);
  private toastService = inject(ToastService);
  equipo!: EquipoDTO | undefined;
  nombreEquipo: string = 'Recrea de Juerga';
  jugadores: JugadorDTO[] = [];
  valores_equipo: ValorEquipo[] = [
    {
      titulo: 'Compromiso',
      descripcion:
        'El compromiso es dar la cara en cada jugada, apoyar al compañero sin condiciones y mantenernos firmes en las buenas y en las malas. Somos leales al escudo y a lo que representa.',
      imagen: 'assets/img/compromiso.png',
    },
    {
      titulo: 'Deportividad',
      descripcion:
        'Jugamos limpio, con respeto al rival, al árbitro y al juego. Valoramos la humildad, la actitud positiva y el saber ganar o perder sin perder la cabeza ni los valores.',
      imagen: 'assets/img/deportividad.png',
    },
    {
      titulo: 'Mentalidad ganadora',
      descripcion:
        'Nunca bajamos los brazos. Creemos en nosotros, en el trabajo constante y en la mejora diaria. Cada partido es una oportunidad para crecer y superarnos.',
      imagen: 'assets/img/mentalidad.png',
    },
    {
      titulo: 'Espíritu de Juerga',
      descripcion:
        'Primero bebemos y luego jugamos… ¿o era al revés? Da igual. Lo importante es brindar, correr un poco y echar unas risas. Aquí se viene a sudar la camiseta y a vaciar la nevera.',
      imagen: 'assets/img/juerga.png',
    },
  ];

  ngOnInit(): void {
    this.equipoService
      .getEquipoPorNombre(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (equipo: EquipoDTO) => {
          this.equipo = equipo;
          this.jugadorService
            .getJugadoresDeUnEquipo(this.equipo.id)
            .pipe(take(1))
            .subscribe({
              next: (jugadores: JugadorDTO[]) => {
                this.jugadores = jugadores.filter(
                  (jugador: JugadorDTO) => jugador.cromo != null
                );
              },
              error: (err: HttpErrorResponse) => {
                this.toastService.show({
                  severity: 'error',
                  summary: 'Error al obtener el equipo',
                  detail:
                    err.error?.detail || 'Ha ocurrido un error inesperado.',
                });
              },
            });
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

  detallesJugador(id: String) {
    const equipoUrl = this.nombreEquipo.replace(/ /g, '_');
    this.router.navigate(['app', equipoUrl, 'jugadores', id]);
  }
}
