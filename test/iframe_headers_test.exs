defmodule IframeHeadersTest do
  use ExUnit.Case
  use Plug.Test

  doctest IframeHeaders

  # Demo module with plug and a simple index action
  defmodule DemoPlug do
    use Plug.Builder

    plug IframeHeaders

    plug :index
    defp index(conn, _opts), do: conn |> send_resp(200, "OK")
  end

  test "it works!" do
    conn = conn(:get, "/")
    |> DemoPlug.call([])

    assert conn.status == 200
  end

  test "we receive a custom header with content" do
    conn = conn(:get, "/")
    |> DemoPlug.call([])

    assert get_resp_header(conn, "p3p") == ["CP=\"Internet Explorer Requires This In Order To Set Third Party Cookies\""]
  end

  test "we receive a custom header without X-Frame-Options" do
    conn = conn(:get, "/")
    |> DemoPlug.call([])

    assert get_resp_header(conn, "x-frame-options") == []
  end
end
