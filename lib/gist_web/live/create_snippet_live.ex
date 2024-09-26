defmodule GistWeb.CreateSnippetLive do
  use GistWeb, :live_view
  alias Gist.{Snippets, Snippets.Snippet}

  def mount(_params, _session, socket) do
    socket = assign(socket, form: to_form(Snippets.change_snippet(%Snippet{})))
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex">
      <.header>
        Instantly share Elixir code, notes and snippets.
        <:subtitle>Gist away</:subtitle>
      </.header>
      <.simple_form for={@form} phx-submit="create" phx-change="validate">
        <.input
          field={@form[:description]}
          type="text"
          placeholder="Gist description"
          autocomplete="off"
          phx-debounce="blur"
        />
        <.input
          field={@form[:name]}
          type="text"
          placeholder="Gist name"
          autocomplete="off"
          phx-debounce="blur"
        />
        <.input
          field={@form[:markup_text]}
          type="textarea"
          placeholder="Code"
          autocomplete="off"
          spellcheck="false"
          phx-debounce="blur"
        />
        <.button phx-disable-with="Creating...">Create</.button>
      </.simple_form>
    </div>
    """
  end

  def handle_event("create", %{"snippet" => params}, socket) do
    case Snippets.create_snippet(socket.assigns.current_user, params) do
      {:ok, _snippet} ->
        changeset = Snippets.change_snippet(%Snippet{})
        {:noreply, assign(socket, form: to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  def handle_event("validate", %{"snippet" => params}, socket) do
    changeset =
      %Snippet{}
      |> Snippets.change_snippet(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: to_form(changeset))}
  end
end
