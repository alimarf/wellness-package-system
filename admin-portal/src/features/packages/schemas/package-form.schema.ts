import { z } from "zod";

export const packageFormSchema = z.object({
  name: z
    .string()
    .refine((s) => s.trim().length > 0, { message: "Name is required" }),
  description: z.string(),
  price: z
    .string()
    .refine(
      (s) => {
        if (s === "") return true;
        const n = parseFloat(s);
        return Number.isFinite(n) && n >= 0;
      },
      { message: "Price must be 0 or greater" }
    ),
  duration_minutes: z
    .string()
    .refine(
      (s) => {
        if (s === "") return true;
        const n = parseInt(s, 10);
        return Number.isFinite(n) && n >= 1;
      },
      { message: "Duration must be at least 1 minute" }
    ),
  available: z.boolean(),
});

export const packageFormInputSchema = z.object({
  name: z.string(),
  description: z.string(),
  price: z.string(),
  duration_minutes: z.string(),
  available: z.boolean(),
});

export type PackageFormValues = z.infer<typeof packageFormInputSchema>;
