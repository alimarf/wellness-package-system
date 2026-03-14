import { Module } from '@nestjs/common';
import { PrismaModule } from '../../prisma/prisma.module';
import { WellnessPackageRepository } from './repositories/wellness-package.repository';
import { WellnessPackageService } from './services/wellness-package.service';
import { AdminWellnessPackageController } from './controllers/admin.wellness-package.controller';
import { MobileWellnessPackageController } from './controllers/mobile.wellness-package.controller';

@Module({
  imports: [PrismaModule],
  controllers: [AdminWellnessPackageController, MobileWellnessPackageController],
  providers: [WellnessPackageRepository, WellnessPackageService],
})
export class WellnessPackageModule {}
