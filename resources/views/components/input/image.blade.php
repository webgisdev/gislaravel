
<div class="bg-white border border-slate-300 rounded-md p-1" wire:ignore x-data="state()" x-on:clear-upload.window="clearUpload">
    <div>
        <input type="file" x-ref="filepond" {{ $attributes->whereDoesntStartWith('wire:model')->except(['id']) }}>
    </div>
</div>

@once
    @push('styles')
        @vite(['resources/css/components/filepond.css'])
    @endpush
    @push('scripts')
        @vite(['resources/js/components/filepond.js'])
        <script>
            function state() {
                return {
                    pond: {},
                    init() {
                        this.pond = window.FilePond.create(this.$refs.filepond, {
                            allowMultiple: false,
                            acceptedFileTypes: ['image/png', 'image/jpeg'],
                            maxFileSize: '4MB',
                        });

                        this.pond.setOptions({
                            server: {
                                process: (fieldName, file, metadata, load, error, progess, abort, transfer,
                                options) => {
                                    @this.upload('{{ $attributes->wire('model')->value() }}', file, load, error,
                                        progess);
                                },
                                revert: (filename, load) => {
                                    @this.removeUpload('{{ $attributes->wire('model')->value() }}', filename, load);
                                },
                            },
                        })
                    },
                    clearUpload() {
                        this.pond.removeFile();
                    },
                }
            }
        </script>
    @endpush
@endonce
