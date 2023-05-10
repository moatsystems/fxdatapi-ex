defmodule WeeklyAverage do
  alias HTTPoison

  @base_url "https://fxdatapi.com/v1/weekly_average"
  @content_type "application/json"
  @accept "application/json"

  defp login_and_get_cookie(username, password) do
    with {:ok, _login_response} <- Auth.login(username, password) do
      {:ok, "user_type=member; username=#{username}"}
    else
      {:error, _} -> {:error, "Login failed"}
    end
  end

  def get(username, password, from_date, to_date) do
    with {:ok, cookie} <- login_and_get_cookie(username, password),
         url <- "#{@base_url}/#{from_date}/#{to_date}",
         headers <- [{"Content-Type", @content_type}, {"Accept", @accept}, {"Cookie", cookie}],
         {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} <- HTTPoison.get(url, headers) do
      {:ok, Poison.decode!(response_body)}
    else
      {:error, error} -> {:error, error}
    end
  end
end
