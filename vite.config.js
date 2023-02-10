import {
    defineConfig
} from 'vite';
import laravel, {
    refreshPaths
} from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/css/components/map.css',
                'resources/css/components/filepond.css',
                'resources/js/app.js',
                'resources/js/components/map.js',
                'resources/js/components/filepond.js',
            ],
            refresh: [
                ...refreshPaths,
                'app/Http/Livewire/**',
            ],
        }),
    ],
});
