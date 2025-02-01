<script>
	import { page } from '$app/state';
	import SearchInput from '$lib/components/SearchInput.svelte';

	let yt_id = page.url.searchParams.get('yt_id') || '';
	let yt_title = page.url.searchParams.get('yt_title') || '';
	let artist_cluster_id = page.url.searchParams.get('artist_cluster_id') || '';
</script>

<form class="flex flex-wrap gap-4">
	<header class="basis-full mb-1 text-xl">Add Artist</header>
	<section class="border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">YouTube</header>
		<div class="flex flex-wrap gap-x-6">
			<label>
				<span>ID</span>
				<input class="block" name="yt_id" required type="text" bind:value={yt_id} />
			</label>
			<SearchInput button_label="YouTube Search" title="Search" />
			<label>
				<span>Title</span>
				<input
					class="block bg-gray-200"
					name="yt_title"
					readonly
					required
					type="text"
					bind:value={yt_title}
				/>
			</label>
		</div>
	</section>
	<section class=" border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">Artist Cluster</header>
		<div class="flex flex-wrap gap-x-6">
			<label>
				<span>ID</span>
				<input
					class="block"
					name="artist_cluster_id"
					required
					type="text"
					bind:value={artist_cluster_id}
				/>
			</label>
			<SearchInput button_label="Artist Cluster Search" title="Search" />
			<aside class="bg-gray-200 form-input">
				<header class="underline">In this Cluster</header>
			</aside>
		</div>
	</section>
	<button class="bg-blue-700 form-input h-fit text-white" type="submit">Add</button>
</form>
