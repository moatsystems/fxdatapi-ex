defmodule Performances do
  alias HTTPoison

  @base_url "https://fxdatapi.com/v1/performances"
  @accept "application/json"

  defp login_and_get_cookie(username, password) do
    with {:ok, _login_response} <- Auth.login(username, password) do
      {:ok, "user_type=member; username=#{username}"}
    else
      {:error, _} -> {:error, "Login failed"}
    end
  end

  def get_all(username, password) do
    with {:ok, cookie} <- login_and_get_cookie(username, password),
         query_string <- URI.encode_query(%{"username" => username}),
         url <- "#{@base_url}?#{query_string}",
         headers <- [{"Accept", @accept}, {"Cookie", cookie}],
         {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} <- HTTPoison.get(url, headers) do
      {:ok, Poison.decode!(response_body)}
    else
      {:error, error} -> {:error, error}
    end
  end

  def get_by_id(username, password, uuid) do
    with {:ok, cookie} <- login_and_get_cookie(username, password),
         query_string <- URI.encode_query(%{"username" => username}),
         url <- "#{@base_url}/#{uuid}?#{query_string}",
         headers <- [{"Accept", @accept}, {"Cookie", cookie}],
         {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} <- HTTPoison.get(url, headers) do
      {:ok, Poison.decode!(response_body)}
    else
      {:error, error} -> {:error, error}
    end
  end
end
