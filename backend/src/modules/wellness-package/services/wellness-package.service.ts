import { Injectable } from '@nestjs/common';
import { WellnessPackageRepository } from '../repositories/wellness-package.repository';
import { CreateWellnessPackageRequestDto } from '../dto/requests/create.wellness-package.request.dto';
import { UpdateWellnessPackageRequestDto } from '../dto/requests/update.wellness-package.request.dto';
import { WellnessPackage } from 'generated/prisma/client';
import { WellnessPackageResponseDto } from '../dto/responses/get.wellness-package.response.dto';
import { CreateWellnessPackageResponseDto } from '../dto/responses/create.wellness-package.response.dto';
import { UpdateWellnessPackageResponseDto } from '../dto/responses/update.wellness-package.response.dto';
import { WellnessPackageMapper } from '../mapper/wellness-package-mapper';

@Injectable()
export class WellnessPackageService {
  constructor(private readonly repository: WellnessPackageRepository) { }

  async findAll(filter?: { available?: boolean }): Promise<WellnessPackageResponseDto[]> {
    return (await this.repository.findAll(filter)).map((item) => WellnessPackageMapper.toResponseDto(item));
  }

  async findOne(id: string): Promise<WellnessPackageResponseDto> {
    return WellnessPackageMapper.toResponseDto(await this.repository.findOne(id));
  }

  async create(dto: CreateWellnessPackageRequestDto): Promise<CreateWellnessPackageResponseDto> {
    return WellnessPackageMapper.toResponseDto(await this.repository.create(dto));
  }

  async update(
    id: string,
    dto: UpdateWellnessPackageRequestDto,
  ): Promise<UpdateWellnessPackageResponseDto> {
    return WellnessPackageMapper.toResponseDto(await this.repository.update(id, dto));
  }

  async remove(id: string): Promise<WellnessPackageResponseDto> {
    return WellnessPackageMapper.toResponseDto(await this.repository.delete(id));
  }
}
