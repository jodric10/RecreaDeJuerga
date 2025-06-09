import { EquipoSimpleDTO } from '../equipo/equipoSimple';
import { JugadorSimpleDTO } from '../jugador/jugadorSimple';

export interface PartidoDTO {
  id: string;                   
  fecha: string;              
  lugar: string;
  estado: string;
  equipoLocal: EquipoSimpleDTO;
  equipoVisitante: EquipoSimpleDTO;
  golesLocal: number;
  golesVisitante: number;
  mvp: JugadorSimpleDTO;
}
