<script>
	import MagnifyingGlass from './MagnifyingGlass.svelte';

	/**
	 * @typedef {object} TProps
	 * @property {string} button_label
	 * @property {string} title
	 */

	/** @type {TProps} */
	let { button_label, title } = $props();

	let q = '';
</script>

<label>
	<span>{title}</span>
	<div class="flex">
		<input class="block" type="search" bind:value={q} />
		<button aria-label={button_label} class="bg-blue-700 form-input text-white" type="button">
			<MagnifyingGlass />
		</button>
	</div>
</label>
