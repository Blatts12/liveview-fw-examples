defmodule ExampleWeb.TestThreeLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~V"""
    <script setup lang="ts">
      import { useLiveVue } from "live_vue";
      import Button from "../Button.vue";
      const live = useLiveVue();
      const props = defineProps<{ count: number }>();
    </script>

    <template>
      <p>{{ props.count }}</p>
      <Button @click="live.pushEvent('inc', { by: 10 })">Click</Button>
    </template>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def handle_event("inc", %{"by" => by}, socket) do
    by = if is_binary(by), do: String.to_integer(by), else: by
    {:noreply, update(socket, :count, &(&1 + by))}
  end
end
