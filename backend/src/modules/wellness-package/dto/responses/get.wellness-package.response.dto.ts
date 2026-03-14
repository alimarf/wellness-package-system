export class WellnessPackageResponseDto {
  id: string;
  name: string;
  description?: string | null;
  price: string;
  duration_minutes: number;
  created_at: Date;
  available: boolean;
}
