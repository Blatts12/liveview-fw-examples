defmodule ExampleWeb.TestOneLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.vue v-component="Counter" v-socket={@socket} v-on:inc={JS.push("inc")} count={@count} />
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

  def handle_event("dec", %{"by" => by}, socket) do
    by = if is_binary(by), do: String.to_integer(by), else: by
    {:noreply, update(socket, :count, &(&1 - by))}
  end
end
