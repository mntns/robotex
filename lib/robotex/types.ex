defmodule Robotex.Type do

  defmodule User do
    defstruct id: nil, first_name: nil, last_name: nil, username: nil
    @type t :: %User{id: integer, first_name: String.t, last_name: String.t, username: String.t}
  end

  defmodule GroupChat do
    defstruct id: nil, title: nil
    @type t :: %GroupChat{id: integer, title: String.t}
  end

  # TODO: Message

  defmodule PhotoSize do
    defstruct file_id: nil, width: nil, height: nil, file_size: nil
    @type t :: %PhotoSize{file_id: String.t, width: integer, height: integer, file_size: integer}
  end

  defmodule Audio do
    defstruct file_id: nil, duration: nil, performer: nil, title: nil, mime_type: nil, file_size: nil
    @type t :: %Audio{file_id: String.t, duration: integer, performer: String.t, title: String.t, mime_type: String.t, file_size: integer}
  end

  defmodule Document do
    defstruct file_id: nil, thumb: nil, file_name: nil, mime_type: nil, file_size: nil
    @type t :: %Document{file_id: String.t, thumb: PhotoSize.t, file_name: String.t, mime_type: String.t, file_size: integer}
  end

  defmodule Sticker do
    defstruct file_id: nil, width: nil, height: nil, thumb: nil, file_size: nil
    @type t :: %Sticker{file_id: String.t, width: integer, height: integer, thumb: PhotoSize.t, file_size: integer}
  end

  defmodule Video do
    defstruct file_id: nil, width: nil, height: nil, duration: nil, thumb: nil, mime_type: nil, file_size: nil
    @type t :: %Video{file_id: String.t, width: integer, height: integer, duration: integer, thumb: PhotoSize.t, mime_type: String.t, file_size: integer}
  end

  defmodule Voice do
    defstruct file_id: nil, duration: nil, mime_type: nil, file_size: nil
    @type t :: %Voice{file_id: String.t, duration: integer, mime_type: String.t, file_size: integer}
  end

  defmodule Contact do
    defstruct phone_number: nil, first_name: nil, last_name: nil, user_id: nil
    @type t :: %Contact{phone_number: String.t, first_name: String.t, last_name: String.t, user_id: integer}
  end

  defmodule Location do
    defstruct longitude: nil, latitude: nil
    @type t :: %Location{longitude: float, latitude: float}
  end

  defmodule Update do
    defstruct update_id: nil, message: nil
    @type t :: %Update{update_id: integer, message: Message.t}
  end

  defmodule UserProfilePhotos do
    defstruct total_count: nil, photos: nil
    @type t :: %UserProfilePhotos{total_count: integer, photos: [[PhotoSize.t]]}
  end

  # TODO: keyboard-related types
end

