defmodule Blognew.Repo do
  use Ecto.Repo,
    otp_app: :blognew,
    adapter: Ecto.Adapters.Postgres
end
