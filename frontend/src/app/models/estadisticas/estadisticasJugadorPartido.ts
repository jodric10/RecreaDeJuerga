import { JugadorSimpleDTO } from '../jugador/jugadorSimple';

export interface EstadisticasJugadorPartidoDTO {
  id: string;
  partidoId: string;
  jugador: JugadorSimpleDTO;
  goles: number;
  asistencias: number;
  amarilla: boolean;
  roja: boolean;
  portero: boolean;
}
