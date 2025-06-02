export interface JugadorFormularioDTO {
  nombre: string;
  apodo?: string;
  dorsal: number;
  posicion?: string;
  pieDominante?: string;
  golesTotales?: number;      
  asistenciasTotales?: number; 
  fortalezas?: string;
  fechaNacimiento?: string;   
  equipoId: string;        
  fotoFrontal?: string;
  fotoTarjeta?: string;
  fotoPose?: string;
}
