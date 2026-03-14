"use client";

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { PackageForm } from "./package-form";
import { getApiErrorMessage } from "@/infrastructure/api/client";
import type { CreatePackagePayload } from "@/domain/wellness-package";
import type { UseMutationResult } from "@tanstack/react-query";

export interface CreatePackageDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  mutation: UseMutationResult<unknown, Error, CreatePackagePayload, unknown>;
}

export function CreatePackageDialog({
  open,
  onOpenChange,
  mutation,
}: CreatePackageDialogProps) {
  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>Create package</DialogTitle>
          <DialogDescription>
            Add a new wellness package. Name and price are required.
          </DialogDescription>
        </DialogHeader>
        <PackageForm
          onSubmit={async (payload) => {
            await mutation.mutateAsync(payload);
            onOpenChange(false);
          }}
          onCancel={() => onOpenChange(false)}
          isLoading={mutation.isPending}
          error={
            mutation.error ? getApiErrorMessage(mutation.error) : null
          }
          submitLabel="Create"
        />
      </DialogContent>
    </Dialog>
  );
}
