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
import type { WellnessPackage, UpdatePackagePayload } from "@/domain/wellness-package";
import type { UseMutationResult } from "@tanstack/react-query";

export interface EditPackageDialogProps {
  package: WellnessPackage | null;
  onClose: () => void;
  mutation: UseMutationResult<
    unknown,
    Error,
    { id: string; payload: UpdatePackagePayload },
    unknown
  >;
}

export function EditPackageDialog({
  package: pkg,
  onClose,
  mutation,
}: EditPackageDialogProps) {
  return (
    <Dialog open={!!pkg} onOpenChange={(open) => !open && onClose()}>
      <DialogContent className="sm:max-w-md">
        <DialogHeader>
          <DialogTitle>Edit package</DialogTitle>
          <DialogDescription>
            Update the package details below.
          </DialogDescription>
        </DialogHeader>
        {pkg && (
          <PackageForm
            initialValues={pkg}
            onSubmit={async (payload) => {
              await mutation.mutateAsync({ id: pkg.id, payload });
              onClose();
            }}
            onCancel={onClose}
            isLoading={mutation.isPending}
            error={
              mutation.error ? getApiErrorMessage(mutation.error) : null
            }
            submitLabel="Update"
          />
        )}
      </DialogContent>
    </Dialog>
  );
}
