defmodule CoffeeRoulettePhonix.PageController do
  use CoffeeRoulettePhonix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
