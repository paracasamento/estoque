import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = { title: "Estoque do Bar", description: "Controle simples de estoque" };
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="pt-BR"><body>{children}</body></html>}
