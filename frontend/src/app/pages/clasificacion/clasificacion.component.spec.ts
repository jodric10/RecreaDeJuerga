import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClasificacionComponent } from './clasificacion.component';

describe('ClasificacionComponent', () => {
  let component: ClasificacionComponent;
  let fixture: ComponentFixture<ClasificacionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClasificacionComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClasificacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
