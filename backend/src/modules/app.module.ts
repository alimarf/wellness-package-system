import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { WellnessPackageModule } from './wellness-package/wellness-package.module';
import { AdminWellnessPackageController } from './wellness-package/controllers/admin.wellness-package.controller';
import { MobileWellnessPackageController } from './wellness-package/controllers/mobile.wellness-package.controller';

@Module({
  imports: [WellnessPackageModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
