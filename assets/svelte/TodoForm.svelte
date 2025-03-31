<script>
  let { children, header } = $props();
</script>

<section>
  {@render header?.()}
  <div>{@render children?.()}</div>
</section>
