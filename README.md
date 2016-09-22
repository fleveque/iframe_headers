# IframeHeaders

Set HTTP headers so your application can work inside an iframe, allowing cookie setting, etc. It deletes X-Frame-Options header, and add a fake P3P one.

Warning: This header combination could be considered insecure, so use it only for a good reason. This was made mainly to learn elixir.

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
  And use the plug at your needs

    ```elixir
    plug IframeHeaders
    ```

## Example

I made a simple server app to try it https://github.com/fleveque/iframe_headers_demo

## Thanks

Based on [How to write a plug package and publish it on hex](http://www.cultivatehq.com/posts/how-to-write-a-plug-package-and-publish-it-on-hex/) by Mark Connell. Nice tutorial to create your own plug package.
