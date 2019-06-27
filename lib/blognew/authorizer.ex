defmodule Blognew.Authorizer do
  @moduledoc """
  Authorize page based on owner and people with access
  """

  def manage?(action, object, user) do
    can_act?(action) && is_owner?(object, user)
  end

  defp can_act?(action) do
    action in [:edit, :update, :delete]
  end

  defp is_owner?(object, user) do
    object.user_id == user.id
  end
end
