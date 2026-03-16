"use client";

import { useState } from "react";
import { authClient } from "@/lib/auth-client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { Loader2, ShieldCheck, Key } from "lucide-react";
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

export default function MfaPage() {
  const [code, setCode] = useState("");
  const [backupCode, setBackupCode] = useState("");
  const [loading, setLoading] = useState(false);
  const router = useRouter();

  const handleVerifyTotp = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!code) return;
    setLoading(true);

    const { data, error } = await authClient.twoFactor.verifyTotp({
      code,
    });

    if (error) {
      toast.error(error.message || "Invalid verification code");
      setLoading(false);
    } else {
      toast.success("Identity verified");
      router.push("/admin");
    }
  };

  const handleVerifyBackupCode = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!backupCode) return;
    setLoading(true);

    const { data, error } = await authClient.twoFactor.verifyBackupCode({
      code: backupCode,
    });

    if (error) {
      toast.error(error.message || "Invalid backup code");
      setLoading(false);
    } else {
      toast.success("Identity verified");
      router.push("/admin");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center px-4 bg-background transition-colors duration-300">
      <Card className="w-full max-w-md border-border dark:border-white/10 bg-card/80 backdrop-blur-md">
        <CardHeader className="text-center">
          <div className="mx-auto w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center mb-4">
            <ShieldCheck className="w-6 h-6 text-primary" />
          </div>
          <CardTitle className="text-2xl font-bold">Two-Factor Authentication</CardTitle>
          <CardDescription>
            Choose a method to verify your identity
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Tabs defaultValue="totp" className="w-full">
            <TabsList className="grid w-full grid-cols-2 mb-6">
              <TabsTrigger value="totp">Auth App</TabsTrigger>
              <TabsTrigger value="backup">Backup Code</TabsTrigger>
            </TabsList>
            
            <TabsContent value="totp">
              <form onSubmit={handleVerifyTotp} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="code">Authentication Code</Label>
                  <Input
                    id="code"
                    placeholder="000000"
                    value={code}
                    onChange={(e) => setCode(e.target.value)}
                    required
                    autoFocus
                    autoComplete="one-time-code"
                  />
                  <p className="text-xs text-muted-foreground">
                    Enter the 6-digit code from your authenticator app.
                  </p>
                </div>
                <Button type="submit" className="w-full" disabled={loading || !code}>
                  {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  Verify Code
                </Button>
              </form>
            </TabsContent>
            
            <TabsContent value="backup">
              <form onSubmit={handleVerifyBackupCode} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="backupCode">Backup Code</Label>
                  <div className="relative">
                    <Key className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
                    <Input
                      id="backupCode"
                      className="pl-9"
                      placeholder="Enter a backup code"
                      value={backupCode}
                      onChange={(e) => setBackupCode(e.target.value)}
                      required
                    />
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Use one of the backup codes you saved during setup.
                  </p>
                </div>
                <Button type="submit" className="w-full" disabled={loading || !backupCode}>
                  {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                  Verify Backup Code
                </Button>
              </form>
            </TabsContent>
          </Tabs>
        </CardContent>
        <CardFooter className="flex justify-center border-t border-border/50 pt-4">
          <Button variant="ghost" size="sm" onClick={() => router.push("/login")}>
            Back to login
          </Button>
        </CardFooter>
      </Card>
    </div>
  );
}
