import { TestBed } from '@angular/core/testing';

import { ParecidoService } from './parecido.service';

describe('ParecidoService', () => {
  let service: ParecidoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ParecidoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
