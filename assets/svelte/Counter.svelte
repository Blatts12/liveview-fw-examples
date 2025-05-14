<script>
  import { Button } from "carbon-components-svelte";
  let { count = 0, live } = $props();

  let base = $state(1);
  let multi = $state(1);
  let by = $derived(base * multi);

  function increment() {
    live.pushEvent("inc", { by });
  }
</script>

<div class="p-2">
  <div class="flex items-center gap-2 mb-2">
    <Button
      onclick={increment}
      class="px-4 py-2 uppercase font-semibold bg-black hover:bg-black/80 cursor-pointer text-white rounded-md grow"
    >
      +{by}
    </Button>
    <p class="font-semibold min-w-[4ch] text-center">{count}</p>
    <Button
      phx-click="dec"
      phx-value-by={by}
      class="px-4 py-2 uppercase font-semibold bg-black hover:bg-black/80 cursor-pointer text-white rounded-md grow"
    >
      -{by}
    </Button>
  </div>

  <label for="base">Base</label>
  <input
    id="base"
    type="range"
    bind:value={base}
    min="1"
    max="10"
    class="w-full"
  />
  <p class="text-right mr-2">{base}</p>

  <label for="multi">Multiplier</label>
  <input
    id="multi"
    type="range"
    bind:value={multi}
    min="1"
    max="10"
    class="w-full"
  />
  <p class="text-right mr-2">{multi}</p>
</div>
