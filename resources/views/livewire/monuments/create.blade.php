<div class="px-1 py-2">
    <div wire:ignore>
        <button x-show="mode === 'view'" x-on:click="startDrawMonument()" title="Start drawing"
            class="text-slate-500 transition hover:text-slate-800 focus:text-slate-800 focus:outline-none">
            Start drawing
        </button>
        <button x-show="mode === 'draw'" x-on:click="stopDrawMonument()" title="Stop drawing"
            class="text-slate-500 transition hover:text-slate-800 focus:text-slate-800 focus:outline-none">
            Stop drawing
        </button>
    </div>
    <form action="" wire:submit.prevent="save" class="mt-1 space-y-1">
        <div>
            <x-input.label for="longitude" value="Longitude" />
            <x-input.text wire:model.defer="coordinates.0" id="longitude" />
            <x-jet-input-error for="coordinates.0" class="mt-1" />
        </div>

        <div>
            <x-input.label for="latitude" value="Latitude" />
            <x-input.text wire:model.defer="coordinates.1" id="latitude" />
            <x-jet-input-error for="coordinates.1" class="mt-1" />
        </div>

        <div>
            <x-input.label for="name" value="Name" />
            <x-input.text wire:model.defer="name" id="name" />
            <x-jet-input-error for="name" class="mt-1" />
        </div>

        <div>
            <x-input.label for="upload" value="Picture" />
            <x-input.image wire:model.defer="upload"/>
            <x-jet-input-error for="upload" class="mt-1" />
        </div>

        <div class="pt-3 flex justify-end items-center space-x-3">
            <x-jet-action-message class="mr-3" on="saved" />

            <x-jet-secondary-button type="submit" wire:loading.attr="disabled" wire:target="save">
                Save
            </x-jet-secondary-button>
        </div>
    </form>
</div>
