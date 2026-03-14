import axios, { type AxiosError } from "axios";
import type { ApiResponse } from "./api-types";

const baseURL = process.env.NEXT_PUBLIC_API_URL ?? "http://localhost:3001";


export const apiClient = axios.create({
  baseURL,
  headers: { "Content-Type": "application/json" },
});

export function unwrapApiResponse<T>(res: ApiResponse<T>): T {
  if (!res.success || res.statusCode < 200 || res.statusCode >= 300) {
    throw new Error(res.message ?? "Request failed");
  }
  return res.data;
}

export function getApiErrorMessage(error: unknown): string {
  if (axios.isAxiosError(error)) {
    const ax = error as AxiosError<{ message?: string }>;
    return ax.response?.data?.message ?? ax.message ?? "Request failed";
  }
  return error instanceof Error ? error.message : "Request failed";
}
