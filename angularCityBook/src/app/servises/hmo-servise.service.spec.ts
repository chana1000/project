import { TestBed } from '@angular/core/testing';

import { HmoServiseService } from './hmo-servise.service';

describe('HmoServiseService', () => {
  let service: HmoServiseService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(HmoServiseService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
