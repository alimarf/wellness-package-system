import { Test, TestingModule } from '@nestjs/testing';
import { WellnessPackageService } from './wellness-package.service';
import { WellnessPackageRepository } from '../repositories/wellness-package.repository';
import { CreateWellnessPackageRequestDto } from '../dto/requests/create.wellness-package.request.dto';
import { UpdateWellnessPackageRequestDto } from '../dto/requests/update.wellness-package.request.dto';

const mockEntity = {
  id: '550e8400-e29b-41d4-a716-446655440000',
  name: 'Spa Package',
  description: 'Relaxing',
  price: 99.99,
  duration_minutes: 60,
  created_at: new Date('2025-01-15T10:00:00.000Z'),
  available: true,
};

describe('WellnessPackageService', () => {
  let service: WellnessPackageService;
  let repository: jest.Mocked<WellnessPackageRepository>;

  beforeEach(async () => {
    const mockRepository = {
      findAll: jest.fn(),
      findOne: jest.fn(),
      create: jest.fn(),
      update: jest.fn(),
      delete: jest.fn(),
    };

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        WellnessPackageService,
        { provide: WellnessPackageRepository, useValue: mockRepository },
      ],
    }).compile();

    service = module.get(WellnessPackageService);
    repository = module.get(WellnessPackageRepository) as jest.Mocked<WellnessPackageRepository>;
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('findAll', () => {
    it('should return mapped response DTOs', async () => {
      repository.findAll.mockResolvedValue([mockEntity as any]);

      const result = await service.findAll();

      expect(repository.findAll).toHaveBeenCalledWith(undefined);
      expect(result).toHaveLength(1);
      expect(result[0].id).toBe(mockEntity.id);
      expect(result[0].name).toBe(mockEntity.name);
      expect(result[0].price).toBe('99.99');
    });

    it('should pass filter to repository', async () => {
      repository.findAll.mockResolvedValue([]);

      await service.findAll({ available: true });

      expect(repository.findAll).toHaveBeenCalledWith({ available: true });
    });
  });

  describe('findOne', () => {
    it('should return mapped response DTO for existing id', async () => {
      repository.findOne.mockResolvedValue(mockEntity as any);

      const result = await service.findOne(mockEntity.id);

      expect(repository.findOne).toHaveBeenCalledWith(mockEntity.id);
      expect(result.id).toBe(mockEntity.id);
      expect(result.price).toBe('99.99');
    });
  });

  describe('create', () => {
    it('should create and return mapped DTO', async () => {
      const dto: CreateWellnessPackageRequestDto = {
        name: 'New Package',
        description: 'Desc',
        price: 49.99,
        duration_minutes: 30,
        available: true,
      };
      repository.create.mockResolvedValue({ ...mockEntity, ...dto, price: dto.price } as any);

      const result = await service.create(dto);

      expect(repository.create).toHaveBeenCalledWith(dto);
      expect(result.name).toBe('New Package');
      expect(result.price).toBe('49.99');
    });
  });

  describe('update', () => {
    it('should update and return mapped DTO', async () => {
      const dto: UpdateWellnessPackageRequestDto = { name: 'Updated Name' };
      repository.update.mockResolvedValue({ ...mockEntity, name: dto.name } as any);

      const result = await service.update(mockEntity.id, dto);

      expect(repository.update).toHaveBeenCalledWith(mockEntity.id, dto);
      expect(result.name).toBe('Updated Name');
    });
  });

  describe('remove', () => {
    it('should delete and return mapped DTO', async () => {
      repository.delete.mockResolvedValue(mockEntity as any);

      const result = await service.remove(mockEntity.id);

      expect(repository.delete).toHaveBeenCalledWith(mockEntity.id);
      expect(result.id).toBe(mockEntity.id);
    });
  });
});
