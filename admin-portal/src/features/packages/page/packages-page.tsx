"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { getApiErrorMessage } from "@/infrastructure/api/client";
import {
  usePackages,
  PackageTable,
  CreatePackageDialog,
  EditPackageDialog,
  DeletePackageDialog,
} from "@/features/packages";
import type { WellnessPackage } from "@/domain/wellness-package";
import { Plus } from "lucide-react";

export function PackagesPage() {
  const [createOpen, setCreateOpen] = useState(false);
  const [editing, setEditing] = useState<WellnessPackage | null>(null);
  const [deleting, setDeleting] = useState<WellnessPackage | null>(null);

  const {
    packages,
    isLoading,
    error,
    createMutation,
    updateMutation,
    deleteMutation,
  } = usePackages();

  return (
    <div className="min-h-screen bg-background">
      <main className="mx-auto max-w-5xl px-4 py-8">
        <div className="flex flex-col gap-6">
          <div className="flex flex-wrap items-center justify-between gap-4">
            <h1 className="text-2xl font-semibold tracking-tight">
              Wellness Package Management
            </h1>
            <Button onClick={() => setCreateOpen(true)}>
              <Plus className="size-4" />
              Create package
            </Button>
          </div>

          {isLoading && (
            <p className="text-muted-foreground">Loading packages…</p>
          )}
          {error && (
            <div className="rounded-lg bg-destructive/10 px-4 py-3 text-sm text-destructive">
              {getApiErrorMessage(error)}
            </div>
          )}
          {!isLoading && !error && packages.length === 0 && (
            <div className="rounded-xl border border-dashed border-border bg-muted/30 px-6 py-12 text-center">
              <p className="text-muted-foreground">No packages yet.</p>
              <Button
                className="mt-4"
                variant="outline"
                onClick={() => setCreateOpen(true)}
              >
                Create your first package
              </Button>
            </div>
          )}
          {!isLoading && !error && packages.length > 0 && (
            <PackageTable
              packages={packages}
              onEdit={setEditing}
              onDelete={setDeleting}
            />
          )}
        </div>
      </main>

      <CreatePackageDialog
        open={createOpen}
        onOpenChange={setCreateOpen}
        mutation={createMutation}
      />
      <EditPackageDialog
        package={editing}
        onClose={() => setEditing(null)}
        mutation={updateMutation}
      />
      <DeletePackageDialog
        package={deleting}
        onClose={() => setDeleting(null)}
        onConfirm={(id) => deleteMutation.mutate(id)}
        isPending={deleteMutation.isPending}
      />
    </div>
  );
}
