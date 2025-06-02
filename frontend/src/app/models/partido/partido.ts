import { EquipoDTO } from '../equipo/equipo';
import { JugadorSimpleDTO } from '../jugador/jugadorSimple';

export interface PartidoDTO {
  id: string;                   
  fecha: string;              
  lugar: string;
  estado: string;
  equipoLocal: EquipoDTO;
  equipoVisitante: EquipoDTO;
  golesLocal: number;
  golesVisitante: number;
  mvp: JugadorSimpleDTO;
}
