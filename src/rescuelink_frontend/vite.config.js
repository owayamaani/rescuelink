import { fileURLToPath, URL } from 'url';
import { defineConfig } from 'vite';
import environment from 'vite-plugin-environment';
import vue from '@vitejs/plugin-vue';
import dotenv from 'dotenv';

dotenv.config({ path: '../../.env' });

export default defineConfig({
  build: {
    emptyOutDir: true,
    rollupOptions: {
      // If you want to bundle axios with your project, remove this "external" field
      // Otherwise, include axios via CDN in your HTML file if marked as external
      external: [], // Removed 'axios' from external
    }
  },
  optimizeDeps: {
    esbuildOptions: {
      define: {
        global: 'globalThis', // Ensuring proper support for global objects
      },
    },
  },
  server: {
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:4943', // Local backend
        changeOrigin: true,
      },
    },
  },
  plugins: [
    vue(), // Vue integration
    environment('all', { prefix: 'CANISTER_' }), // Picking up CANISTER_ prefixed env vars
    environment('all', { prefix: 'DFX_' }), // Picking up DFX_ prefixed env vars
  ],
  resolve: {
    alias: [
      // Aliases for clean imports
      { find: 'declarations', replacement: fileURLToPath(new URL('../declarations', import.meta.url)) },
      { find: '@', replacement: fileURLToPath(new URL('./src', import.meta.url)) },
    ]
  }
});
