defmodule Robotex do
  @moduledoc """
  Main module containing the important code of this project."
  """
  
  @api_url "https://api.telegram.org/bot"
  

  # Helper methods
  def get_token do
    Application.get_env(:robotex, :token)
  end

  def build_url(method_string) do
    @api_url <> get_token <> "/" <> method_string
  end

  def request(body, method) do
    url = build_url(method)
    case body do
      nil ->
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get(url)
        body |> JSX.decode!([{:labels, :atom}])
      _ ->
        body = JSX.encode!(body)
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.post(url, body, %{"Content-type" => "application/json"})
        body |> JSX.decode!([{:labels, :atom}])
    end
  end


  # API methods

  @doc """
  Returns basic information about the bot.
  """
  def get_me do
    nil |> request("getMe")
    # %User{id: res[:id], first_name: res[:first_name], last_name: res[:last_name], username: res[:username]}
  end

  def send_message(chat_id, text, parse_mode \\ nil, disable_webpage_preview \\ nil, reply_to_message_id \\ nil, reply_markup \\ nil) do
    %{chat_id: chat_id, text: text, parse_mode: parse_mode, disable_webpage_preview: disable_webpage_preview, reply_to_message_id: reply_to_message_id, reply_markup: reply_markup}
    |> Enum.filter(fn {k, v} -> v != nil end)
    |> request("sendMessage")
  end

  def forward_message(chat_id, from_chat_id, message_id) do
    %{chat_id: chat_id, from_chat_id: from_chat_id, message_id: message_id}
    |> request("forwardMessage")
  end

  def send_photo(chat_id, photo, caption \\ nil, reply_to_message_id \\ nil, reply_markup \\ nil) do
    %{chat_id: chat_id, photo: photo}
  end

  def send_audio(chat_id, audio) do
  end

  def send_document(chat_id, document) do
  end 
  
  def send_sticker(chat_id, sticker) do
  end

  def send_video(chat_id, video) do
  end

  def send_location(chat_id, location) do
  end 
  
  def send_chat_action(chat_id, chat_action) do
  end 
  
  def get_update do
    nil |> request("getUpdates")
  end
end
