import { Component, Input } from '@angular/core';
import { ValorEquipo } from '../../models/valorEquipo';

@Component({
  selector: 'app-tarjeta-valor',
  imports: [],
  templateUrl: './tarjeta-valor.component.html',
  styleUrl: './tarjeta-valor.component.css',
})
export class TarjetaValorComponent {
  @Input() valor!: ValorEquipo;
}
