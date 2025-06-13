import { Component, EventEmitter, Input, Output } from '@angular/core';
import { JugadorDTO } from '../../models/jugador/jugador';

@Component({
  selector: 'app-cromo',
  imports: [],
  templateUrl: './cromo.component.html',
  styleUrl: './cromo.component.css',
})
export class CromoComponent {
  @Input() jugador: JugadorDTO | undefined;
  @Output() idJugador = new EventEmitter<String>();

  jugadorSeleccionado() {
    this.idJugador.emit(this.jugador?.id);
  }
}
