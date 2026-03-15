import { getAuth } from "@/lib/auth";

export const GET = async (req: Request) => {
  try {
    const auth = getAuth();
    return await auth.handler(req);
  } catch (error: any) {
    console.error("[Auth Route GET] Error:", error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }
};

export const POST = async (req: Request) => {
  try {
    const auth = getAuth();
    return await auth.handler(req);
  } catch (error: any) {
    console.error("[Auth Route POST] Error:", error);
    return new Response(JSON.stringify({ 
      error: "Internal Server Error", 
      message: error.message,
      stack: process.env.NODE_ENV === 'development' ? error.stack : undefined
    }), { 
      status: 500,
      headers: { "Content-Type": "application/json" }
    });
  }
};

export const ALL = async (req: Request) => {
  const auth = getAuth();
  return await auth.handler(req);
};
