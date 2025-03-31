defmodule ExampleWeb.TestThreeLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div>No Sigil</div>
    """
  end
end
