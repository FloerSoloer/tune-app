<script>
	import { page } from '$app/state';
	import SearchInput from '$lib/components/SearchInput.svelte';

	let yt_id = page.url.searchParams.get('yt_id') || '';
	let yt_title = page.url.searchParams.get('yt_title') || '';
	let track_cluster_id = page.url.searchParams.get('track_cluster_id') || '';
	let artist_cluster_id = page.url.searchParams.get('artist_cluster_id') || '';
	let oa_rating = +(page.url.searchParams.get('oa_rating') || 0);
</script>

<form class="flex flex-wrap gap-4">
	<header class="basis-full mb-1 text-xl">Add Track</header>
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
		<header class="basis-full mb-1 text-lg">Track Cluster</header>
		<div class="flex flex-wrap gap-x-6">
			<label>
				<span>ID</span>
				<input
					class="block"
					name="track_cluster_id"
					required
					type="text"
					bind:value={track_cluster_id}
				/>
			</label>
			<SearchInput button_label="Track Cluster Search" title="Search" />
			<aside class="bg-gray-200 form-input">
				<header class="underline">In this Cluster</header>
			</aside>
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
	<section class="border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">Rating</header>
		<div class="flex items-end">
			<div class="flex flex-col items-center">
				<span>Overall</span>
				<textarea aria-label="Overall Review" name="oa_review"></textarea>
			</div>
			<input
				aria-label="Overall Rating"
				class="block h-fit"
				max="6"
				min="-2"
				name="oa_rating"
				required
				type="number"
				bind:value={oa_rating}
			/>
		</div>
	</section>
	<button class="bg-blue-700 form-input h-fit text-white" type="submit">Add</button>
</form>
