import type {
  WellnessPackage,
  CreatePackagePayload,
  UpdatePackagePayload,
} from "@/domain/wellness-package";
import type { ApiResponse } from "./api-types";
import { apiClient, unwrapApiResponse } from "./client";


export async function getPackages(): Promise<WellnessPackage[]> {
  const { data } = await apiClient.get<ApiResponse<WellnessPackage[]>>(
    "/api/admin/packages"
  );
  const list = unwrapApiResponse(data);
  return Array.isArray(list) ? list : [];
}

export async function createPackage(
  payload: CreatePackagePayload
): Promise<WellnessPackage> {
  const { data } = await apiClient.post<ApiResponse<WellnessPackage>>(
    "/api/admin/packages",
    payload
  );
  return unwrapApiResponse(data);
}

export async function updatePackage(
  id: string,
  payload: UpdatePackagePayload
): Promise<WellnessPackage> {
  const { data } = await apiClient.put<ApiResponse<WellnessPackage>>(
    `/api/admin/packages/${id}`,
    payload
  );
  return unwrapApiResponse(data);
}

export async function deletePackage(id: string): Promise<void> {
  const { data } = await apiClient.delete<ApiResponse<unknown>>(
    `/api/admin/packages/${id}`
  );
  unwrapApiResponse(data);
}
