import { Component, EventEmitter, inject, OnInit, Output } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { JugadorService } from '../../services/jugador/jugador.service';
import { JugadorDTO } from '../../models/jugador/jugador';
import { CommonModule } from '@angular/common';
import { JugadorParecidoSimpleDTO } from '../../models/parecido/jugadorParecidoSimple';

@Component({
  selector: 'app-detalles-jugador',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './detalles-jugador.component.html',
  styleUrl: './detalles-jugador.component.css',
})
export class DetallesJugadorComponent implements OnInit {
  private route = inject(ActivatedRoute);
  private jugadorService = inject(JugadorService);

  jugador: JugadorDTO | null = null;
  cargando = true;
  parecidos: string = '';

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      const id = params.get('jugadorId');
      if (!id) return;

      this.cargando = true;

      this.jugadorService.getJugador(id).subscribe((jugador: JugadorDTO) => {
        this.jugador = jugador;
        this.parecidos = jugador.parecidos.map((p: JugadorParecidoSimpleDTO) => p.parecido).join(', ');
        this.jugadorService.seleccionarJugador(jugador);
        this.cargando = false;
      });
    });
  }
}
