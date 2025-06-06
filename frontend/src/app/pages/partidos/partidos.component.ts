import { Component, inject, OnInit } from '@angular/core';
import { CeldaPartidoComponent } from '../../components/celda-partido/celda-partido.component';
import { PartidoDTO } from '../../models/partido/partido';
import { PartidoService } from '../../services/partido/partido.service';
import { ActivatedRoute } from '@angular/router';
import { EquipoService } from '../../services/equipo/equipo.service';
import { take } from 'rxjs';
import { EquipoDTO } from '../../models/equipo/equipo';

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
  nombreEquipo: string = '';
  equipo: EquipoDTO | undefined;

  ngOnInit(): void {
    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');

    this.equipoService
      .getEquipoPorNombre(this.nombreEquipo)
      .pipe(take(1))
      .subscribe({
        next: (equipo) => {
          this.cargarPartidos(equipo);
        },
        error: (err) => {
          console.error('Error al obtener el equipo desde el backend', err);
        }
      });
  }

  private cargarPartidos(equipo: EquipoDTO): void {
    this.equipo = equipo;

    this.partidoService
      .getPartidosDeUnEquipo(equipo.id)
      .pipe(take(1))
      .subscribe({
        next: (partidos) => {
          this.partidosEquipo = partidos;
        },
        error: (err) => {
          console.error('Error al obtener los partidos del equipo', err);
        }
      });
  }
}
