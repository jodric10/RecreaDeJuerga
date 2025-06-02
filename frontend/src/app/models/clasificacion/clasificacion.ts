import { EquipoDTO } from "../equipo/equipo";

export interface ClasificacionDTO {
  id: string;
  puntos: number;
  partidosJugados: number;
  ganados: number;
  empatados: number;
  perdidos: number;
  golesAFavor: number;
  golesContra: number;
  diferenciaGoles: number;
  promedioTfTc: number;
  equipo: EquipoDTO;
}
