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
      <h1 class="font-semibold">Instantly share Elixir code, notes and snippets.</h1>
      <.simple_form for={@form}>
        <.input
          field={@form[:description]}
          type="text"
          placeholder="Gist description"
          autocomplete="off"
        />
        <.input field={@form[:name]} type="text" placeholder="Gist name" autocomplete="off" />
        <.input
          field={@form[:markup_text]}
          type="textarea"
          placeholder="Code"
          autocomplete="off"
          spellcheck="false"
        />
        <.button phx-disable-with="Creating...">Create</.button>
      </.simple_form>
    </div>
    """
  end
end
