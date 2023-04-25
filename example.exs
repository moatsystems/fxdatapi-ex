# Import Modules
alias Auth
alias Currencies
alias Historical
alias MarginsSpreads
alias DailyAverage
alias WeeklyAverage
alias Convert
alias ConvertAll

# Set your username and password
username = System.get_env("USERNAME")
password = System.get_env("PASSWORD")

# Call the Auth.login/2 function with the provided username and password
result = Auth.login(username, password)

# Process the result
case result do
  {:ok, response} ->
    IO.puts("Login successful!")
    IO.inspect(response)

    # Currencies Endpoint
    day = 19
    month = 4
    year = 2024
    currency_uuid = "594bffc4-d095-11ed-9e30-acde48001122"

    # Call the Currencies.get_all/4 function
    get_all_result = Currencies.get_all(username, password, day, month, year)

    # Process the get_all_result
    case get_all_result do
      {:ok, response} ->
        IO.puts("Get all currencies successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get all currencies failed:")
        IO.puts(error_message)
    end

    # Call the Currencies.get_by_id/5 function
    get_by_id_result = Currencies.get_by_id(username, password, day, month, year, currency_uuid)

    # Process the get_by_id_result
    case get_by_id_result do
      {:ok, response} ->
        IO.puts("Get currency by ID successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get currency by ID failed:")
        IO.puts(error_message)
    end

    # Historical Endpoint
    date = "2023_04_02"
    day_historical = 2
    month_historical = 4
    year_historical = 2023
    uuid_historical = "fe1ee1c4-d162-11ed-a2dc-acde48001122"

    # Call the Historical.get_all/6 function
    get_all_historical_result = Historical.get_all(username, password, date, day_historical, month_historical, year_historical)

    # Process the get_all_historical_result
    case get_all_historical_result do
      {:ok, response} ->
        IO.puts("Get all historical data successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get all historical data failed:")
        IO.puts(error_message)
    end

    # Call the Historical.get_by_id/7 function
    get_by_id_historical_result = Historical.get_by_id(username, password, date, day_historical, month_historical, year_historical, uuid_historical)

    # Process the get_by_id_historical_result
    case get_by_id_historical_result do
      {:ok, response} ->
        IO.puts("Get historical data by ID successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get historical data by ID failed:")
        IO.puts(error_message)
    end

    # Margins and Spreads Endpoint
    day = 19
    month = 4
    year = 2023
    margin_spread_uuid = "0673aff8-e306-11ed-b4ea-acde48001122"

    # Call the MarginsSpreads.get_all/4 function
    get_all_result = MarginsSpreads.get_all(username, password, day, month, year)

    # Process the get_all_result
    case get_all_result do
      {:ok, response} ->
        IO.puts("Get all margins and spreads successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get all margins and spreads failed:")
        IO.puts(error_message)
    end

    # Call the MarginsSpreads.get_by_id/6 function
    get_by_id_result = MarginsSpreads.get_by_id(username, password, day, month, year, margin_spread_uuid)

    # Process the get_by_id_result
    case get_by_id_result do
      {:ok, response} ->
        IO.puts("Get margin and spread by ID successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get margin and spread by ID failed:")
        IO.puts(error_message)
    end

    # Daily Average Endpoint
    date_daily = "2023_04_10"
    daily_average_result = DailyAverage.get(username, password, date_daily)

    # Process the daily_average_result
    case daily_average_result do
      {:ok, response} ->
        IO.puts("Get daily average successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get daily average failed:")
        IO.puts(error_message)
    end

    # Weekly Average Endpoint
    from_date = "2023_04_03"
    to_date = "2023_04_07"
    weekly_average_result = WeeklyAverage.get(username, password, from_date, to_date)

    # Process the weekly_average_result
    case weekly_average_result do
      {:ok, response} ->
        IO.puts("Get weekly average successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Get weekly average failed:")
        IO.puts(error_message)
    end

    # Convert Endpoint
    base_currency = "GBP"
    target_currency = "EUR"
    amount = 500
    date_convert = "2023_04_19"

    # Call the Convert.get/6 function
    convert_result = Convert.get(username, password, date_convert, base_currency, target_currency, amount)

    # Process the convert_result
    case convert_result do
      {:ok, response} ->
        IO.puts("Convert successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Convert failed:")
        IO.puts(error_message)
    end

    # Convert All Endpoint
    base_currency_all = "GBP"
    amount_all = 120

    # Call the ConvertAll.get/5 function
    convert_all_result = ConvertAll.get(username, password, base_currency_all, amount_all, date_convert)

    # Process the convert_all_result
    case convert_all_result do
      {:ok, response} ->
        IO.puts("Convert all successful!")
        IO.inspect(response)

      {:error, error_message} ->
        IO.puts("Convert all failed:")
        IO.puts(error_message)
    end

  {:error, error_message} ->
    IO.puts("Login failed:")
    IO.puts(error_message)
end