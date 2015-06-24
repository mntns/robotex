defmodule Robotex do
  @api_url "https://api.telegram.org/bot"

  def get_token do
    Application.get_env(:robotex, :token)
  end

  def build_url(method_string) do
    @api_url <> get_token <> "/" <> method_string
  end

  def request(method, request_body \\ nil) do
    IO.inspect request_body
    url = build_url(method)
    IO.inspect url

    case request_body do
      nil ->
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)
        body |> JSX.decode!
      _ ->
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.post(url, request_body)
        body |> JSX.decode!
    end
  end


  # API methods

  def get_me do
    "getMe" |> request
  end

  def send_message(chat_id, text, disable_web_page_preview \\ nil, reply_to_message_id \\ nil, reply_markup \\ nil) do
    body = %{chat_id: chat_id, text: text} |> JSX.encode!
    request("sendMessage", body)
  end

  def forward_message(chat_id, from_chat_id, message_id) do
  end

  def send_photo(chat_id, photo) do
  end

  def getUpdate do
    "getUpdates" |> request
  end
end
