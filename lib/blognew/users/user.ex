defmodule Blognew.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    has_many :posts, Blognew.CMS.Post

    timestamps()
  end
end
