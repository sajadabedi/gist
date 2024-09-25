defmodule GistWeb.PageController do
  use GistWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/create")
  end
end
