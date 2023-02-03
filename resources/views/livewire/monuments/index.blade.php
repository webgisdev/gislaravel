<div class="px-1 py-2">
    <input type="search" wire:model.debounce.300ms="search" class="w-full rounded-md border-gray-300 px-2 py-1.5"
        placeholder="Search">
    <ul class="mt-4 space-y-2">
        @forelse($monuments as $monument)
            <li class="flex items-center justify-between">
                <span class="ml-1 text-gray-600">{{ $monument->name }} ({{ $monument->country ?? 'Unknown' }})</span>
                <button x-on:click.prevent="gotoMonument({{ $monument->geojson }})" title="Go to {{ $monument->name }}"
                    class="text-slate-500 transition hover:text-slate-800 focus:text-slate-800 focus:outline-none">
                    <svg class="h5 w-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z">
                        </path>
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z"></path>
                    </svg>
                </button>
            </li>
        @empty
            <li>No monuments found.</li>
        @endforelse
    </ul>
    @if ($monuments->hasPages())
        <div class="mt-4">{{ $monuments->links() }}</div>
    @endif

</div>
