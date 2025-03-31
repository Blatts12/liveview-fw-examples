<script>
  let { children, class: className, ...props } = $props();
</script>

<button
  class={[
    "px-4 py-2 uppercase font-semibold bg-black hover:bg-black/80 cursor-pointer text-white rounded-md",
    className,
  ]}
  {...props}
>
  {@render children()}
</button>
