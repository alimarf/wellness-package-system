export interface WellnessPackage {
  id: string;
  name: string;
  description?: string | null;
  price: string;
  duration_minutes: number;
  created_at: string;
  available: boolean;
}

export interface CreatePackagePayload {
  name: string;
  description?: string | null;
  price: number;
  duration_minutes: number;
  available?: boolean;
}

export interface UpdatePackagePayload {
  name?: string;
  description?: string | null;
  price?: number;
  duration_minutes?: number;
  available?: boolean;
}
