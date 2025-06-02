export interface PartidoFormularioDTO {
  fecha: string;
  lugar: string;
  estado: string;
  equipoLocalId: string;
  equipoVisitanteId: string;
  golesLocal?: number;
  golesVisitante?: number;
  mvpId?: string;
}
