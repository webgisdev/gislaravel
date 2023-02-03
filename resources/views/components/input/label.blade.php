@props(['value'])

<label
    {{ $attributes->merge(['class' => 'whitespace-nowrap block font-medium text-sm text-gray-700 mb-1']) }}>
    {{ $value ?? $slot }}
</label>