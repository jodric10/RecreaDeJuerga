import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParecidosAdminComponent } from './parecidos-admin.component';

describe('ParecidosAdminComponent', () => {
  let component: ParecidosAdminComponent;
  let fixture: ComponentFixture<ParecidosAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ParecidosAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ParecidosAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
