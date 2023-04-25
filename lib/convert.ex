defmodule Convert do
  alias HTTPoison

  @base_url "https://currensees.com/v1/convert"
  @content_type "application/json"
  @accept "application/json"

  defp login_and_get_cookie(username, password) do
    with {:ok, _login_response} <- Auth.login(username, password) do
      {:ok, "user_type=member; username=#{username}"}
    else
      {:error, _} -> {:error, "Login failed"}
    end
  end

  def get(username, password, date, base_currency, target_currency, amount) do
    with {:ok, cookie} <- login_and_get_cookie(username, password),
         post_body = %{
           "username" => username,
           "date" => date,
           "base_currency" => base_currency,
           "target_currency" => target_currency,
           "amount" => amount
         },
         headers <- [{"Content-Type", @content_type}, {"Accept", @accept}, {"Cookie", cookie}],
         {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} <- HTTPoison.post(@base_url, Poison.encode!(post_body), headers) do
      {:ok, Poison.decode!(response_body)}
    else
      {:error, error} -> {:error, error}
    end
  end
end
