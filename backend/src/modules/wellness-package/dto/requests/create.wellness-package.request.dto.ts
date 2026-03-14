import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsOptional, IsNumber, Min, IsBoolean } from 'class-validator';

export class CreateWellnessPackageRequestDto {
  @ApiProperty({ example: 'Spa & Massage Package' })
  @IsString()
  name: string;

  @ApiPropertyOptional({ example: 'Relaxing 60-minute massage with aromatherapy', nullable: true })
  @IsOptional()
  @IsString()
  description?: string | null;

  @ApiProperty({ example: 99.99, minimum: 0 })
  @IsNumber()
  @Min(0)
  price: number;

  @ApiProperty({ example: 60, minimum: 1, description: 'Duration in minutes' })
  @IsNumber()
  @Min(1)
  duration_minutes: number;

  @ApiPropertyOptional({ example: true, default: true })
  @IsOptional()
  @IsBoolean()
  available?: boolean;
}
