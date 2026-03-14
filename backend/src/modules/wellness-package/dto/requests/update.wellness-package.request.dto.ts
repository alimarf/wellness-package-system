import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsOptional, IsNumber, Min, IsBoolean } from 'class-validator';

export class UpdateWellnessPackageRequestDto {
  @ApiPropertyOptional({ example: 'Spa & Massage Package' })
  @IsOptional()
  @IsString()
  name?: string;

  @ApiPropertyOptional({ example: 'Relaxing 60-minute massage with aromatherapy', nullable: true })
  @IsOptional()
  @IsString()
  description?: string | null;

  @ApiPropertyOptional({ example: 99.99, minimum: 0 })
  @IsOptional()
  @IsNumber()
  @Min(0)
  price?: number;

  @ApiPropertyOptional({ example: 60, minimum: 1, description: 'Duration in minutes' })
  @IsOptional()
  @IsNumber()
  @Min(1)
  duration_minutes?: number;

  @ApiPropertyOptional({ example: true })
  @IsOptional()
  @IsBoolean()
  available?: boolean;
}
