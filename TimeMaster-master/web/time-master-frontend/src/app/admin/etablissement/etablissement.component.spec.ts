import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EtablissementComponent } from './etablissement.component';

describe('EtablissementComponent', () => {
  let component: EtablissementComponent;
  let fixture: ComponentFixture<EtablissementComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [EtablissementComponent]
    });
    fixture = TestBed.createComponent(EtablissementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
