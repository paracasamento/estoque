import { redirect } from "next/navigation";
import { cookies } from "next/headers";
import "./login.css";

async function login(formData: FormData){"use server";const user=String(formData.get("user")||"");const pass=String(formData.get("password")||"");if(user===(process.env.BAR_USER||"admin")&&pass===(process.env.BAR_PASSWORD||"admin")){(await cookies()).set("bar_session",process.env.SESSION_SECRET||"estoque-local",{httpOnly:true,sameSite:"lax",secure:process.env.NODE_ENV==="production",maxAge:60*60*24*30});redirect("/");}redirect("/login?erro=1");}
export default async function Login({searchParams}:{searchParams:Promise<{erro?:string}>}){const q=await searchParams;return <main className="login"><div className="card"><div className="mark">E</div><h1>Estoque do Bar</h1><p>Entre para continuar</p><form action={login}><label>Usuário<input name="user" autoComplete="username" required/></label><label>Senha<input name="password" type="password" autoComplete="current-password" required/></label>{q.erro&&<small>Usuário ou senha incorretos.</small>}<button>Entrar</button></form></div></main>}
