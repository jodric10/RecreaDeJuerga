import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClasificacionAdminComponent } from './clasificacion-admin.component';

describe('ClasificacionAdminComponent', () => {
  let component: ClasificacionAdminComponent;
  let fixture: ComponentFixture<ClasificacionAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ClasificacionAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ClasificacionAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
