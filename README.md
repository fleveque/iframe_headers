# IframeHeaders

Set HTTP headers so your application can work inside an iframe, allowing cookie setting, etc.

It deletes X-Frame-Options header, and add a fake P3P one.

Warning: This header combination could be considered insecure, so use it only for a good reason.

## Installation

  1. Add `iframe_headers` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:iframe_headers, "~> 0.1.0"}]
    end
    ```

  2. If you are using phoenix, you can put the plug in `web/router.ex`:

    ```elixir
    pipeline :browser do
      plug IframeHeaders
    end
    ```

  Otherwise, ensure `iframe_headers` is started before your application:

    ```elixir
    def application do
      [applications: [:iframe_headers]]
    end
    ```
  And use the plug where at your needs

    ```elixir
    plug IframeHeaders
    ```
