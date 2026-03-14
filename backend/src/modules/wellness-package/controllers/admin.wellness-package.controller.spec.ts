import { Test, TestingModule } from '@nestjs/testing';
import { AdminWellnessPackageController } from './admin.wellness-package.controller';
import { WellnessPackageService } from '../services/wellness-package.service';
import { CreateWellnessPackageRequestDto } from '../dto/requests/create.wellness-package.request.dto';
import { UpdateWellnessPackageRequestDto } from '../dto/requests/update.wellness-package.request.dto';

const mockResponseDto = {
  id: '550e8400-e29b-41d4-a716-446655440000',
  name: 'Spa Package',
  description: 'Relaxing',
  price: '99.99',
  duration_minutes: 60,
  created_at: new Date('2025-01-15T10:00:00.000Z'),
  available: true,
};

describe('AdminWellnessPackageController', () => {
  let controller: AdminWellnessPackageController;
  let service: jest.Mocked<WellnessPackageService>;

  beforeEach(async () => {
    const mockService = {
      create: jest.fn(),
      findAll: jest.fn(),
      findOne: jest.fn(),
      update: jest.fn(),
      remove: jest.fn(),
    };

    const module: TestingModule = await Test.createTestingModule({
      controllers: [AdminWellnessPackageController],
      providers: [
        { provide: WellnessPackageService, useValue: mockService },
      ],
    }).compile();

    controller = module.get(AdminWellnessPackageController);
    service = module.get(WellnessPackageService) as jest.Mocked<WellnessPackageService>;
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  describe('create', () => {
    it('should call service.create with body and return result', async () => {
      const dto: CreateWellnessPackageRequestDto = {
        name: 'New',
        price: 29.99,
        duration_minutes: 45,
      };
      service.create.mockResolvedValue(mockResponseDto as any);

      const result = await controller.create(dto);

      expect(service.create).toHaveBeenCalledWith(dto);
      expect(result).toEqual(mockResponseDto);
    });
  });

  describe('findAll', () => {
    it('should return list from service', async () => {
      service.findAll.mockResolvedValue([mockResponseDto as any]);

      const result = await controller.findAll();

      expect(service.findAll).toHaveBeenCalled();
      expect(result).toHaveLength(1);
      expect(result[0].id).toBe(mockResponseDto.id);
    });
  });

  describe('findOne', () => {
    it('should return one package by id', async () => {
      service.findOne.mockResolvedValue(mockResponseDto as any);

      const result = await controller.findOne(mockResponseDto.id);

      expect(service.findOne).toHaveBeenCalledWith(mockResponseDto.id);
      expect(result).toEqual(mockResponseDto);
    });
  });

  describe('update', () => {
    it('should call service.update with id and body', async () => {
      const dto: UpdateWellnessPackageRequestDto = { name: 'Updated' };
      service.update.mockResolvedValue({ ...mockResponseDto, name: 'Updated' } as any);

      const result = await controller.update(mockResponseDto.id, dto);

      expect(service.update).toHaveBeenCalledWith(mockResponseDto.id, dto);
      expect(result.name).toBe('Updated');
    });
  });

  describe('remove', () => {
    it('should call service.remove with id', async () => {
      service.remove.mockResolvedValue(mockResponseDto as any);

      const result = await controller.remove(mockResponseDto.id);

      expect(service.remove).toHaveBeenCalledWith(mockResponseDto.id);
      expect(result.id).toBe(mockResponseDto.id);
    });
  });
});
