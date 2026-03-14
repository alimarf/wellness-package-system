import { WellnessPackageResponseDto } from "../dto/responses/get.wellness-package.response.dto";
import { WellnessPackage } from "generated/prisma/client";

export class WellnessPackageMapper {
  static toResponseDto(entity: WellnessPackage): WellnessPackageResponseDto {
    return {
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price.toString(),
      duration_minutes: entity.duration_minutes,
      created_at: entity.created_at,
      available: entity.available,
    };
  }
}