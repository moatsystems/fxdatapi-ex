defmodule ConvertAll do
  alias HTTPoison

  @base_url "https://fxdatapi.com/v1/convert_all"
  @content_type "application/json"
  @accept "application/json"

  defp login_and_get_cookie(username, password) do
    with {:ok, _login_response} <- Auth.login(username, password) do
      {:ok, "user_type=member; username=#{username}"}
    else
      {:error, _} -> {:error, "Login failed"}
    end
  end

  def get(username, password, base_currency, amount, date) do
    with {:ok, cookie} <- login_and_get_cookie(username, password),
         post_body = %{
           "username" => username,
           "base_currency" => base_currency,
           "amount" => amount,
           "date" => date
         },
         headers <- [{"Content-Type", @content_type}, {"Accept", @accept}, {"Cookie", cookie}],
         {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} <- HTTPoison.post(@base_url, Poison.encode!(post_body), headers) do
      {:ok, Poison.decode!(response_body)}
    else
      {:error, error} -> {:error, error}
    end
  end
end
