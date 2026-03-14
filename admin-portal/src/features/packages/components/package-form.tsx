"use client";

import { useState, useCallback } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import { Textarea } from "@/components/ui/textarea";
import type { WellnessPackage, CreatePackagePayload } from "@/domain/wellness-package";
import {
  packageFormSchema,
  type PackageFormValues,
} from "@/features/packages/schemas/package-form.schema";

const defaultValues: PackageFormValues = {
  name: "",
  description: "",
  price: "",
  duration_minutes: "",
  available: true,
};

function packageToFormValues(pkg: WellnessPackage): PackageFormValues {
  return {
    name: pkg.name,
    description: pkg.description ?? "",
    price: pkg.price,
    duration_minutes: String(pkg.duration_minutes),
    available: pkg.available,
  };
}

function formValuesToPayload(values: PackageFormValues): CreatePackagePayload {
  const price = parseFloat(values.price);
  const duration_minutes = parseInt(values.duration_minutes, 10);
  return {
    name: values.name.trim(),
    description: values.description.trim() || undefined,
    price: Number.isFinite(price) ? price : 0,
    duration_minutes: Number.isFinite(duration_minutes) ? duration_minutes : 0,
    available: values.available,
  };
}

export interface PackageFormProps {
  initialValues?: WellnessPackage | null;
  onSubmit: (payload: CreatePackagePayload) => void | Promise<void>;
  onCancel: () => void;
  isLoading?: boolean;
  error?: string | null;
  submitLabel?: string;
}

export function PackageForm({
  initialValues,
  onSubmit,
  onCancel,
  isLoading = false,
  error = null,
  submitLabel = "Save",
}: PackageFormProps) {
  const [values, setValues] = useState<PackageFormValues>(
    initialValues ? packageToFormValues(initialValues) : defaultValues
  );
  const [fieldErrors, setFieldErrors] = useState<
    Partial<Record<keyof PackageFormValues, string>>
  >({});

  const update = useCallback(
    (field: keyof PackageFormValues, value: string | boolean) => {
      setValues((prev) => ({ ...prev, [field]: value }));
      setFieldErrors((prev) => {
        const next = { ...prev };
        delete next[field];
        return next;
      });
    },
    []
  );

  const validate = useCallback((): boolean => {
    const result = packageFormSchema.safeParse(values);
    if (result.success) {
      setFieldErrors({});
      return true;
    }
    const errors: Partial<Record<keyof PackageFormValues, string>> = {};
    for (const issue of result.error.issues) {
      const key = issue.path[0] as keyof PackageFormValues;
      if (key in defaultValues && !(key in errors)) {
        errors[key] = issue.message;
      }
    }
    setFieldErrors(errors);
    return false;
  }, [values]);

  const handleSubmit = useCallback(
    (e: React.FormEvent) => {
      e.preventDefault();
      if (!validate()) return;
      const payload = formValuesToPayload(values);
      void onSubmit(payload);
    },
    [values, validate, onSubmit]
  );

  return (
    <form onSubmit={handleSubmit} className="grid gap-4">
      {error && (
        <div className="rounded-lg bg-destructive/10 px-3 py-2 text-sm text-destructive">
          {error}
        </div>
      )}
      <div className="grid gap-2">
        <Label htmlFor="name">Name</Label>
        <Input
          id="name"
          value={values.name}
          onChange={(e) => update("name", e.target.value)}
          placeholder="Package name"
          aria-invalid={!!fieldErrors.name}
        />
        {fieldErrors.name && (
          <p className="text-sm text-destructive">{fieldErrors.name}</p>
        )}
      </div>
      <div className="grid gap-2">
        <Label htmlFor="description">Description</Label>
        <Textarea
          id="description"
          value={values.description}
          onChange={(e) => update("description", e.target.value)}
          placeholder="Optional description"
          rows={3}
        />
      </div>
      <div className="grid gap-2">
        <Label htmlFor="price">Price</Label>
        <Input
          id="price"
          type="number"
          min={0}
          step="0.01"
          value={values.price}
          onChange={(e) => update("price", e.target.value)}
          placeholder="0.00"
          aria-invalid={!!fieldErrors.price}
        />
        {fieldErrors.price && (
          <p className="text-sm text-destructive">{fieldErrors.price}</p>
        )}
      </div>
      <div className="grid gap-2">
        <Label htmlFor="duration_minutes">Duration (minutes)</Label>
        <Input
          id="duration_minutes"
          type="number"
          min={1}
          value={values.duration_minutes}
          onChange={(e) => update("duration_minutes", e.target.value)}
          placeholder="60"
          aria-invalid={!!fieldErrors.duration_minutes}
        />
        {fieldErrors.duration_minutes && (
          <p className="text-sm text-destructive">
            {fieldErrors.duration_minutes}
          </p>
        )}
      </div>
      <div className="flex items-center gap-2">
        <Checkbox
          id="available"
          checked={values.available}
          onCheckedChange={(checked) => update("available", checked === true)}
        />
        <Label htmlFor="available" className="font-normal cursor-pointer">
          Available for booking
        </Label>
      </div>
      <div className="flex justify-end gap-2 pt-2">
        <Button
          type="button"
          variant="outline"
          onClick={onCancel}
          disabled={isLoading}
        >
          Cancel
        </Button>
        <Button type="submit" disabled={isLoading}>
          {isLoading ? "Saving…" : submitLabel}
        </Button>
      </div>
    </form>
  );
}
