// vite.config.js
import { resolve } from 'path'
import { defineConfig } from 'vite'

export default defineConfig({
    define: {
        'process.env': {}
    },
    build: {
        lib: {
            entry: resolve(__dirname, 'src/main.ts'),
            name: 'BccmAppWebLib',
            fileName: 'bccm-app-web-lib',
            formats: ['es']
        },
        outDir: '../web/lib/generated',
        rollupOptions: {
            external: [],
            output: {
                globals: {},
                assetFileNames: "bccm-app-web-lib.[ext]",
            },
        },
    },
})