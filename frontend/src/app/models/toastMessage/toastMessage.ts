export interface ToastMessage {
  id: number;
  severity: 'success' | 'error';
  summary: string;
  detail: string;
  fadeOut?: boolean;
}
