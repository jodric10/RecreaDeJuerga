import { Component, Input } from '@angular/core';
import { EquipoDTO } from '../../models/equipo/equipo';

@Component({
  selector: 'app-tarjeta-equipo',
  imports: [],
  templateUrl: './tarjeta-equipo.component.html',
  styleUrl: './tarjeta-equipo.component.css'
})
export class TarjetaEquipoComponent {
  @Input() info_equipo : EquipoDTO | undefined;
}
