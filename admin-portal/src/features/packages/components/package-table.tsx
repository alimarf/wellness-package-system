"use client";

import { Button } from "@/components/ui/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import type { WellnessPackage } from "@/domain/wellness-package";
import { Pencil, Trash2 } from "lucide-react";

export interface PackageTableProps {
  packages: WellnessPackage[];
  onEdit: (pkg: WellnessPackage) => void;
  onDelete: (pkg: WellnessPackage) => void;
}

export function PackageTable({
  packages,
  onEdit,
  onDelete,
}: PackageTableProps) {
  return (
    <div className="rounded-xl border border-border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Name</TableHead>
            <TableHead>Description</TableHead>
            <TableHead>Price</TableHead>
            <TableHead>Duration</TableHead>
            <TableHead>Available</TableHead>
            <TableHead className="w-[120px]">Actions</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {packages.map((pkg) => (
            <TableRow key={pkg.id}>
              <TableCell className="font-medium">{pkg.name}</TableCell>
              <TableCell className="max-w-[200px] truncate text-muted-foreground">
                {pkg.description || "—"}
              </TableCell>
              <TableCell>${pkg.price}</TableCell>
              <TableCell>{pkg.duration_minutes} min</TableCell>
              <TableCell>
                <span
                  className={
                    pkg.available
                      ? "text-green-600 dark:text-green-400"
                      : "text-muted-foreground"
                  }
                >
                  {pkg.available ? "Yes" : "No"}
                </span>
              </TableCell>
              <TableCell>
                <div className="flex gap-1">
                  <Button
                    variant="ghost"
                    size="icon-sm"
                    onClick={() => onEdit(pkg)}
                    aria-label={`Edit ${pkg.name}`}
                  >
                    <Pencil className="size-4" />
                  </Button>
                  <Button
                    variant="ghost"
                    size="icon-sm"
                    className="text-destructive hover:text-destructive"
                    onClick={() => onDelete(pkg)}
                    aria-label={`Delete ${pkg.name}`}
                  >
                    <Trash2 className="size-4" />
                  </Button>
                </div>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}
