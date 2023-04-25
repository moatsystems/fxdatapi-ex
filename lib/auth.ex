defmodule Auth do
  @moduledoc """
  A simple authentication module to send login requests to the Currency API by Moat Systems Limited.
  """

  alias HTTPoison

  @login_url "https://currensees.com/v1/login"
  @content_type "application/json"
  @accept "application/json"

  @doc """
  Sends a login request with the given username and password.
  """
  def login(username, password) do
    headers = [
      {"Content-Type", @content_type},
      {"Accept", @accept}
    ]

    body = Poison.encode!(%{
      "username" => username,
      "password" => password
    })

    case HTTPoison.post(@login_url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} ->
        {:ok, Poison.decode!(response_body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Request failed with status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Request failed with error: #{inspect(reason)}"}
    end
  end
end
