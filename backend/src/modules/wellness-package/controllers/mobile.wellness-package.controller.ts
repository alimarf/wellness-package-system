import { Controller, Get, Param, ParseUUIDPipe } from '@nestjs/common';
import { WellnessPackageService } from '../services/wellness-package.service';

@Controller('/api/mobile/packages')
export class MobileWellnessPackageController {
  constructor(private readonly wellnessPackageService: WellnessPackageService) {}

  @Get()
  findAll() {
    return this.wellnessPackageService.findAll({ available: true });
  }

  @Get(':id')
  findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.wellnessPackageService.findOne(id);
  }
}
