<script>
  let { id, name, completed, live } = $props();

  function toggle() {
    if (completed) {
      live.pushEvent("incomplete", { id });
    } else {
      live.pushEvent("complete", { id });
    }
  }
</script>

<div class="flex items-center gap-2 my-1">
  <input
    id="task-{id}-checkbox"
    type="checkbox"
    checked={completed}
    onchange={toggle}
  />
  <label for="task-{id}-checkbox">{name}</label>
</div>
