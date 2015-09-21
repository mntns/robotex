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

  # TODO: all the types. ;__;
end

