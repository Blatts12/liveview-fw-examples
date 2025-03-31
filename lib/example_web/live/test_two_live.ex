defmodule ExampleWeb.TestTwoLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.react name="TodoForm" socket={@socket}>
      <h2 class="text-lg font-semibold mb-2 text-center">Create Task</h2>
      <.form id="task-form" for={@form} phx-change="validate" phx-submit="create">
        <.input field={@form[:name]} label="Name" required />
        <.button type="submit" class="mt-2 w-full">Create</.button>
      </.form>
    </.react>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(form: to_form(%{"name" => ""}, as: "task"))}
  end

  @impl true
  def handle_event("validate", _params, socket) do
    # Validate the form
    {:noreply, socket}
  end

  def handle_event("create", _params, socket) do
    # Create the task
    {:noreply, socket}
  end
end
