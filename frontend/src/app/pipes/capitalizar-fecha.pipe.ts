import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  standalone: true,
  name: 'capitalizarFecha',
})
export class CapitalizarFechaPipe implements PipeTransform {
  transform(value: string | null): string {
    if (!value) return '';
    return value.charAt(0).toUpperCase() + value.slice(1);
  }
}
