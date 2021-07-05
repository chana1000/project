import { TestBed } from '@angular/core/testing';

import { ChildrenServiseService } from './children-servise.service';

describe('ChildrenServiseService', () => {
  let service: ChildrenServiseService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ChildrenServiseService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
