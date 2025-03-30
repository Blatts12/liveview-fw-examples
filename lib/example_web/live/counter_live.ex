defmodule ExampleWeb.CounterLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div id="counter" phx-hook="Counter" class="p-2">
      <div class="flex items-center gap-2 mb-2">
        <.button id="inc-btn" phx-click="inc" phx-value-by="1" phx-update="ignore" class="grow">
          +1
        </.button>
        <p class="font-semibold min-w-[4ch] text-center">{@count}</p>
        <.button id="dec-btn" phx-click="dec" phx-value-by="1" phx-update="ignore" class="grow">
          -1
        </.button>
      </div>

      <.input id="base-input" name="base" label="Base" type="range" value="1" min="1" max="10" />
      <p id="base" class="text-right mr-2" phx-update="ignore">1</p>

      <.input
        id="multi-input"
        name="multi"
        label="Multiplier"
        type="range"
        value="1"
        min="1"
        max="10"
      />
      <p id="multi" class="text-right mr-2" phx-update="ignore">1</p>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def handle_event("inc", %{"by" => by}, socket) do
    by = if is_binary(by), do: String.to_integer(by), else: by
    count = socket.assigns.count + by
    {:noreply, assign(socket, count: count)}
  end

  def handle_event("dec", %{"by" => by}, socket) do
    by = if is_binary(by), do: String.to_integer(by), else: by
    count = socket.assigns.count - by
    {:noreply, assign(socket, count: count)}
  end
end
