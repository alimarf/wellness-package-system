export class ApiResponse<T = any> {
  success!: boolean;
  statusCode!: number;
  message!: string;
  data!: T | T[] | null;
}
