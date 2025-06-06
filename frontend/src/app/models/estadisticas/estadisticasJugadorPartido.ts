import { JugadorSimpleDTO } from '../jugador/jugadorSimple';

export interface EstadisticasJugadorPartidoDTO {
  id: string;
  partido: string;
  jugador: JugadorSimpleDTO;
  goles: number;
  asistencias: number;
  amarilla: boolean;
  roja: boolean;
  portero: boolean;
}
