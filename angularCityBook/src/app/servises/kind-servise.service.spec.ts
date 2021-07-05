import { TestBed } from '@angular/core/testing';

import { KindServiseService } from './kind-servise.service';

describe('KindServiseService', () => {
  let service: KindServiseService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(KindServiseService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
