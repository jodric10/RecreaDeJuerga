import { Component, inject, Input, OnInit } from '@angular/core';
import { PartidoDTO } from '../../models/partido/partido';
import { ActivatedRoute, Router } from '@angular/router';
import { ResultadoPartido } from '../../models/enum/resultado-partido.enum';
import { CommonModule } from '@angular/common';
import { CapitalizarFechaPipe } from '../../pipes/capitalizar-fecha.pipe';

@Component({
  selector: 'app-celda-partido',
  imports: [CommonModule, CapitalizarFechaPipe],
  templateUrl: './celda-partido.component.html',
  styleUrl: './celda-partido.component.css',
})
export class CeldaPartidoComponent implements OnInit {
  @Input() partido!: PartidoDTO;
  @Input() index!: number;
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  resultadoEquipo?: ResultadoPartido;
  nombreEquipo!: string;
  private readonly resultadoClases: Record<ResultadoPartido, string> = {
    [ResultadoPartido.Victoria]: 'victoria',
    [ResultadoPartido.Derrota]: 'derrota',
    [ResultadoPartido.Empate]: 'empate',
  };

  resultadoClase(): string {
    return this.resultadoEquipo
      ? this.resultadoClases[this.resultadoEquipo]
      : '';
  }

  ngOnInit(): void {
    if (this.partido.lugar === 'Descanso') return;

    const nombreEquipoURL = this.route.snapshot.params['nombreEquipo'];
    this.nombreEquipo = nombreEquipoURL.replace(/_/g, ' ');

    if (this.partido.estado !== 'Finalizado') return;

    const { equipoLocal, equipoVisitante, golesLocal, golesVisitante } =
      this.partido;

    let golesDelSeguido: number | null = null;
    let golesDelRival: number | null = null;

    if (equipoLocal.nombre === this.nombreEquipo) {
      golesDelSeguido = golesLocal;
      golesDelRival = golesVisitante;
    } else if (equipoVisitante.nombre === this.nombreEquipo) {
      golesDelSeguido = golesVisitante;
      golesDelRival = golesLocal;
    } else {
      console.warn('El equipo seguido no participa en este partido');
      return;
    }

    if (golesDelSeguido > golesDelRival) {
      this.resultadoEquipo = ResultadoPartido.Victoria;
    } else if (golesDelSeguido < golesDelRival) {
      this.resultadoEquipo = ResultadoPartido.Derrota;
    } else {
      this.resultadoEquipo = ResultadoPartido.Empate;
    }
  }

  estadisticas(datosPartido: PartidoDTO) {
    this.router.navigate(['estadisticas', datosPartido.id],
      {
        relativeTo: this.route,
        state: {
          partido: datosPartido,
        },
      }
    );
  }
}
