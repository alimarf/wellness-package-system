"use client";

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import type { WellnessPackage } from "@/domain/wellness-package";

export interface DeletePackageDialogProps {
  package: WellnessPackage | null;
  onClose: () => void;
  onConfirm: (id: string) => void;
  isPending: boolean;
}

export function DeletePackageDialog({
  package: pkg,
  onClose,
  onConfirm,
  isPending,
}: DeletePackageDialogProps) {
  return (
    <Dialog open={!!pkg} onOpenChange={(open) => !open && onClose()}>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Delete package</DialogTitle>
          <DialogDescription>
            Delete &quot;{pkg?.name}&quot;? This cannot be undone.
          </DialogDescription>
        </DialogHeader>
        <DialogFooter>
          <Button variant="outline" onClick={onClose}>
            Cancel
          </Button>
          <Button
            variant="destructive"
            onClick={() => pkg && onConfirm(pkg.id)}
            disabled={isPending}
          >
            {isPending ? "Deleting…" : "Delete"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
