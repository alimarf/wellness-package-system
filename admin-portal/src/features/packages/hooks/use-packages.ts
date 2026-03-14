"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import type {
  CreatePackagePayload,
  UpdatePackagePayload,
} from "@/domain/wellness-package";
import {
  getPackages,
  createPackage,
  updatePackage,
  deletePackage,
} from "@/infrastructure/api/package-api";

const PACKAGES_QUERY_KEY = ["packages"] as const;


export function usePackages() {
  const queryClient = useQueryClient();

  const query = useQuery({
    queryKey: PACKAGES_QUERY_KEY,
    queryFn: getPackages,
  });

  const createMutation = useMutation({
    mutationFn: createPackage,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: PACKAGES_QUERY_KEY });
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({
      id,
      payload,
    }: { id: string; payload: UpdatePackagePayload }) =>
      updatePackage(id, payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: PACKAGES_QUERY_KEY });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: deletePackage,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: PACKAGES_QUERY_KEY });
    },
  });

  return {
    packages: query.data ?? [],
    isLoading: query.isLoading,
    error: query.error,
    createMutation,
    updateMutation,
    deleteMutation,
  };
}
