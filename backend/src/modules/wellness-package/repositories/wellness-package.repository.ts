import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { WellnessPackage } from 'generated/prisma/client';
import { CreateWellnessPackageRequestDto } from '../dto/requests/create.wellness-package.request.dto';
import { UpdateWellnessPackageRequestDto } from '../dto/requests/update.wellness-package.request.dto';

@Injectable()
export class WellnessPackageRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(filter?: { available?: boolean }): Promise<WellnessPackage[]> {
    return await this.prisma.wellnessPackage.findMany({
      where:
        filter?.available !== undefined
          ? { available: filter.available }
          : undefined,
      orderBy: { created_at: 'desc' },
    });
  }

  async findOne(id: string): Promise<WellnessPackage> {
    const pkg = await this.prisma.wellnessPackage.findUnique({
      where: { id },
    });
    if (!pkg) {
      throw new NotFoundException('Wellness package not found');
    }
    return pkg;
  }

  async create(data: CreateWellnessPackageRequestDto): Promise<WellnessPackage> {
    return await this.prisma.wellnessPackage.create({
      data: {
        name: data.name,
        description: data.description ?? undefined,
        price: data.price,
        duration_minutes: data.duration_minutes,
        available: data.available ?? true,
      },
    });
  }

  async update(id: string, data: UpdateWellnessPackageRequestDto): Promise<WellnessPackage> {
    await this.findOne(id);
    return await this.prisma.wellnessPackage.update({
      where: { id },
      data: {
        ...(data.name !== undefined && { name: data.name }),
        ...(data.description !== undefined && { description: data.description }),
        ...(data.price !== undefined && { price: data.price }),
        ...(data.duration_minutes !== undefined && { duration_minutes: data.duration_minutes }),
        ...(data.available !== undefined && { available: data.available }),
      },
    });
  }

  async delete(id: string): Promise<WellnessPackage> {
    await this.findOne(id);
    return await this.prisma.wellnessPackage.delete({
      where: { id },
    });
  }
}
