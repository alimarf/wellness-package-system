import {
  Controller,
  Get,
  Post,
  Body,
  Put,
  Param,
  Delete,
  ParseUUIDPipe,
} from '@nestjs/common';
import { WellnessPackageService } from '../services/wellness-package.service';
import { CreateWellnessPackageRequestDto } from '../dto/requests/create.wellness-package.request.dto';
import { UpdateWellnessPackageRequestDto } from '../dto/requests/update.wellness-package.request.dto';

@Controller('/api/admin/packages')
export class AdminWellnessPackageController {
  constructor(private readonly wellnessPackageService: WellnessPackageService) {}

  @Post()
  create(@Body() createWellnessPackageDto: CreateWellnessPackageRequestDto) {
    return this.wellnessPackageService.create(createWellnessPackageDto);
  }

  @Get()
  findAll() {
    return this.wellnessPackageService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.wellnessPackageService.findOne(id);
  }

  @Put(':id')
  update(
    @Param('id', ParseUUIDPipe) id: string,
    @Body() updateWellnessPackageDto: UpdateWellnessPackageRequestDto,
  ) {
    return this.wellnessPackageService.update(id, updateWellnessPackageDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseUUIDPipe) id: string) {
    return this.wellnessPackageService.remove(id);
  }
}
