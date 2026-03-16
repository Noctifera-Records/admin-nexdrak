"use client";

import { useState, useEffect } from "react";

export interface SiteSettings {
  [key: string]: string;
}

export function useSiteSettings() {
  const [settings, setSettings] = useState<SiteSettings>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchSettings() {
      try {
        const response = await fetch("/api/settings");
        if (!response.ok) {
          throw new Error("Failed to fetch settings");
        }
        const data = await response.json();
        
        // Convert array of {key, value} to object
        const settingsObj = data.reduce((acc: SiteSettings, item: { key: string, value: string }) => {
          acc[item.key] = item.value;
          return acc;
        }, {});
        
        setSettings(settingsObj);
      } catch (err: any) {
        console.error("Error loading site settings:", err);
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }

    fetchSettings();
  }, []);

  return { settings, loading, error };
}
