defmodule Robotex do
  @api_url "https://api.telegram.org/bot"
  
  defp token do
    Application.get_env(:robotex, :token)
  end

  defp build_url(method_string) do
    @api_url <> token <> "/" <> method_string
  end

  defp build_request(params, file_field) do
    {file_path, params} = Keyword.pop(params, file_field)
    case file_field do
      nil -> 
        {:form, params}
      _ ->
        params = for {k, v} <- params, do: {to_string(k), v}
        {:multipart, params ++ [
            {:file, file_path, {"form-data", [{"name", to_string(file_field)}, {"filename", file_path}]}, []}
          ]}
    end
  end
  
  defp parse_response(response) do
    {:ok, response} = response
    response.body |> JSX.decode!
  end

  defp request(method, params, file \\ nil) do
    method 
    |> build_url
    |> HTTPoison.post(build_request(params, file))
    |> parse_response
  end

  def get_me do
    request("getMe", [])
  end

  def send_message(chat_id, text, options \\ []) do
    request("sendMessage", [chat_id: chat_id, text: text] ++ options)
  end

  def forward_message(chat_id, from_chat_id, message_id) do
    request("forwardMessage", [chat_id: chat_id, from_chat_id: from_chat_id, message_id: message_id])
  end

  def send_photo(chat_id, photo, options \\ []) do
    request("sendPhoto", [chat_id: chat_id, photo: photo] ++ options, :photo)
  end

  def send_audio(chat_id, audio, options \\ []) do
    request("sendAudio", [chat_id: chat_id, audio: audio] ++ options, :audio)
  end

  def send_document(chat_id, document, options \\ []) do
    request("sendDocument", [chat_id: chat_id, document: document] ++ options, :document)
  end
  
  def send_sticker(chat_id, sticker, options \\ []) do
    request("sendSticker", [chat_id: chat_id, sticker: sticker] ++ options, :sticker)
  end

  def send_video(chat_id, video, options \\ []) do
    request("sendVideo", [chat_id: chat_id, video: video] ++ options, :video)
  end

  def send_voice(chat_id, voice, options \\ []) do
    request("sendVoice", [chat_id: chat_id, voice: voice] ++ options, :voice)
  end

  def send_location(chat_id, latitude, longitude, options \\ []) do
    request("sendLocation", [chat_id: chat_id, latitude: latitude, longitude: longitude] ++ options)
  end

  def send_chat_action(chat_id, action, options \\ []) do
    request("sendChatAction", [chat_id: chat_id, action: action] ++ options)
  end

  def get_user_profile_photos(user_id, options \\ []) do
    request("getUserProfilePhotos", [user_id: user_id] ++ options)
  end

  def get_updates(options \\ []) do
    request("getUpdates", options)
  end

  def set_webhook(options \\ []) do
    request("setWebhook", options, :certificate)
  end

  def get_file(file_id) do
    request("getFile", [file_id: file_id])
  end
end
