<div x-data="map()">
    <div x-ref="map" class="map h-[600px] border border-slate-300 rounded-md shadow-lg">
    </div>
</div>

@once
    @push('styles')
        @vite(['resources/css/components/map.css'])
    @endpush
    @push('scripts')
        @vite(['resources/js/components/map.js'])
    @endpush
@endonce