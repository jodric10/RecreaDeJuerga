import { EquipoDTO } from '../equipo/equipo';
import { JugadorParecidoSimpleDTO } from '../parecido/jugadorParecidoSimple';


export interface JugadorDTO {
  id: string;
  nombre: string;
  apodo: string;
  dorsal: number;
  posicion: string;
  pieDominante: string;
  golesTotales: number;
  asistenciasTotales: number;
  fortalezas: string;
  fechaNacimiento: string;
  fotoFrontal: string;
  fotoTarjeta: string;
  fotoPose: string;
  parecidos: JugadorParecidoSimpleDTO[];
  equipo: EquipoDTO;
}
