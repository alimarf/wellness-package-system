import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { ApiResponse } from '../dto/api-response.dto';

@Injectable()
export class ResponseInterceptor<T = any> implements NestInterceptor<T, ApiResponse<T>> {
  intercept(context: ExecutionContext, next: CallHandler<T>): Observable<ApiResponse<T>> {
    const ctx = context.switchToHttp();
    const response = ctx.getResponse();

    return next.handle().pipe(
      map((data: T): ApiResponse<T> => {
        const statusCode = response?.statusCode ?? 200;

        return {
          success: statusCode >= 200 && statusCode < 300,
          statusCode,
          message: 'success',
          data: data ?? null,
        };
      }),
    );
  }
}
