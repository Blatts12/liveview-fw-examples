defmodule ExampleWeb.TestThreeLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~V"""
    <script>
    	import Button from "../Button.svelte";
    	const { live, count = 0 } = $props();
    </script>

    <p>{count}</p>
    <Button onclick={() => live.pushEvent("inc", { by: 10 })}>Click</Button>
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
