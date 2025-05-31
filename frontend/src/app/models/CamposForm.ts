import { ValidatorFn } from '@angular/forms';

export interface CamposForm {
  name: string;
  type: string;
  placeholder: string;
  validators?: ValidatorFn[];
}

