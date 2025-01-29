<script>
	import MagnifyingGlass from '$lib/components/MagnifyingGlass.svelte';
</script>

<form class="flex flex-wrap gap-4">
	<section class="border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">YouTube</header>
		<div class="flex flex-wrap gap-x-6">
			<label>
				<span>ID</span>
				<input class="block" name="yt_id" required type="text" />
			</label>
			<label>
				<span>Search</span>
				<div class="flex">
					<input class="block" name="yt_search" type="text" />
					<button
						aria-label="YouTube Search"
						class="bg-blue-700 form-input text-white"
						type="button"
					>
						<MagnifyingGlass />
					</button>
				</div>
			</label>
			<label>
				<span>Title</span>
				<input class="block bg-gray-200" name="yt_title" readonly required type="text" />
			</label>
		</div>
	</section>
	<section class=" border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">Track Cluster</header>
		<div class="flex flex-wrap gap-x-6">
			<label>
				<span>ID</span>
				<input class="block" name="track_cluster_id" required type="text" />
			</label>
			<label>
				<span>Search</span>
				<div class="flex">
					<input class="block" name="track_cluster_search" type="text" />
					<button
						aria-label="Track Cluster Search"
						class="bg-blue-700 form-input text-white"
						type="button"
					>
						<MagnifyingGlass />
					</button>
				</div>
			</label>
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
				<input class="block" name="artist_cluster_id" required type="text" />
			</label>
			<label>
				<span>Search</span>
				<div class="flex">
					<input class="block" name="artist_cluster_search" type="text" />
					<button
						aria-label="Artist Cluster Search"
						class="bg-blue-700 form-input text-white"
						type="button"
					>
						<MagnifyingGlass />
					</button>
				</div>
			</label>
			<aside class="bg-gray-200 form-input">
				<header class="underline">In this Cluster</header>
			</aside>
		</div>
	</section>
	<section class="border border-gray-800 flex flex-col p-4 w-fit">
		<header class="basis-full mb-1 text-lg">Rating</header>
		<label class="items-center flex flex-col w-fit">
			<span>Overall</span>
			<input class="block" max="6" min="-2" name="r_oa" required type="number" value="0" />
		</label>
	</section>
	<button class="bg-blue-700 form-input h-fit text-white" type="submit">Add</button>
</form>
