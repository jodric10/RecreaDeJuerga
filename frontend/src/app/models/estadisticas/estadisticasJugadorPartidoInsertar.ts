export interface EstadisticasJugadorPartidoInsertarDTO {
  jugadorId: string;
  partidoId: string;
  goles?: number;
  asistencias?: number;
  amarilla?: boolean;
  roja?: boolean;
  portero?: boolean;
}
