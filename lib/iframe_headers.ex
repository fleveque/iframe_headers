defmodule IframeHeaders do
  def init(options) do
    options
  end

  def call(conn, _options) do
    conn |> Plug.Conn.put_resp_header("p3p", "CP=\"Internet Explorer Requires This In Order To Set Third Party Cookies\"")
         |> Plug.Conn.delete_resp_header("x-frame-options")
  end
end
