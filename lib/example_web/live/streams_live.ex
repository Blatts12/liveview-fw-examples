defmodule ExampleWeb.StreamsLive do
  use ExampleWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.button phx-click="create">Create</.button>

      <h2 class="font-semibold text-lg">Svelte</h2>
      <div id="tasks-svelte" phx-update="stream">
        <div :for={{dom_id, task} <- @streams.tasks} id={dom_id} class="contents">
          <.svelte
            name="TaskItem"
            socket={@socket}
            props={
              %{
                id: task.id,
                name: task.name,
                completed: task.completed
              }
            }
          />
        </div>
      </div>

      <hr class="my-2" />
      <h2 class="font-semibold text-lg">Phoenix</h2>
      <div id="tasks-phoenix" phx-update="stream">
        <div :for={{dom_id, task} <- @streams.tasks} id={dom_id} class="contents">
          <div class="flex items-center gap-2 my-1">
            <input
              id={"task-#{task.id}-checkbox"}
              type="checkbox"
              checked={task.completed}
              phx-click={if task.completed, do: "incomplete", else: "complete"}
              phx-value-id={task.id}
            />
            <label for={"task-#{task.id}-checkbox"}>{task.name}</label>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> stream_configure(:tasks, dom_id: &"task-#{&1.id}")
     |> stream(:tasks, [
       %{id: Ecto.UUID.generate(), name: "Task", completed: true},
       %{id: Ecto.UUID.generate(), name: "Task", completed: false}
     ])}
  end

  @impl true
  def handle_event("create", _params, socket) do
    {:noreply,
     stream_insert(socket, :tasks, %{id: Ecto.UUID.generate(), name: "Task", completed: false})}
  end

  def handle_event("complete", %{"id" => id}, socket) do
    {:noreply, stream_insert(socket, :tasks, %{id: id, name: "Task", completed: true})}
  end

  def handle_event("incomplete", %{"id" => id}, socket) do
    {:noreply, stream_insert(socket, :tasks, %{id: id, name: "Task", completed: false})}
  end
end
