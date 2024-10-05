defmodule ApiElixirWeb.DefaultController do
 use ApiElixirWeb, :controller
 def index(conn, _params) do
    text(conn, "Welcome to ApiElixir! - #{Mix.env()}")
 end

end
