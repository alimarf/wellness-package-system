import { Injectable } from '@nestjs/common';
import { ApiResponse } from '../common/dto/api-response.dto';

@Injectable()
export class AppService {
  getRoot(): ApiResponse<{ name: string; version: string }> {
    return {
      success: true,
      statusCode: 200,
      message: 'Wellness Package API is running',
      data: {
        name: 'Wellness Package System',
        version: '1.0.0',
      },
    };
  }
}
