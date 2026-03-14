import type { Metadata } from "next";
import "./globals.css";
import { ReactQueryProvider } from "@/components/providers/query-client-provider";

export const metadata: Metadata = {
  title: "Wellness Admin Portal",
  description: "Admin portal for wellness packages",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <ReactQueryProvider>{children}</ReactQueryProvider>
      </body>
    </html>
  );
}