import { EquipoSimpleDTO } from '../equipo/equipoSimple';
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
  cromo: string;
  fotoPose: string;
  num_coleccionable: number;
  parecidos: JugadorParecidoSimpleDTO[];
  equipo: EquipoSimpleDTO;
}
