import { NextRequest, NextResponse } from "next/server";
export function middleware(req:NextRequest){if(req.nextUrl.pathname.startsWith("/login"))return NextResponse.next();const token=req.cookies.get("bar_session")?.value;const expected=process.env.SESSION_SECRET||"estoque-local";if(token!==expected)return NextResponse.redirect(new URL("/login",req.url));return NextResponse.next();}
export const config={matcher:["/((?!_next/static|_next/image|favicon.ico).*)"]};
