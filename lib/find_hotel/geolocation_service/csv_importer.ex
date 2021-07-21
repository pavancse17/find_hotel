defmodule FindHotel.GeolocationService.Statistics do
  defstruct time_taken: "", total: 0, accepted: 0, discarded: 0

  @type t :: %__MODULE__{
          time_taken: String.t(),
          total: integer,
          accepted: integer,
          discarded: integer
        }
end

defmodule FindHotel.GeolocationService.CSVImporter do
  @moduledoc """
  This module responsibilty is to import data from csv file to Geolocation table.
  """
  alias FindHotel.GeolocationService
  alias FindHotel.GeolocationService.Statistics

  @doc """
    This method takes path of the CSV file which contains geolocation data in it and saves all valid data to database.

    Returns {:ok, %Statistics{}} or {:error, message}.

    ## Examples

      iex> import("./dump_data")
      {:ok, %Statistics{}}

      iex> import(nil)
      {:error, "File path is missing"}

      iex> import(4343)
      {:error, "File path needs to be a string value."}
  """
  @spec import(String.t()) :: {:ok, Statistics.t()} | {:error, String.t()}
  def import(nil) do
    {:error, "File path is missing"}
  end

  def import(file_path) when is_binary(file_path) do
    {time_taken, statistics} = :timer.tc(&process_file/1, [file_path])
    statistics = %{statistics | time_taken: "#{time_taken / 1_000_000} Seconds"}
    {:ok, statistics}
  end

  def import(_file_path) do
    {:error, "File path needs to be a string value."}
  end

  @spec process_file(String.t(), Statistics.t()) :: Statistics.t()
  defp process_file(file_path, %Statistics{} = statistics \\ %Statistics{}) do
    file_path
    |> File.stream!()
    |> CSV.decode!(headers: true)
    # We are not using Repo.insert_all,
    # because unique index validation for ip_address won't happen without commiting to db.
    |> Enum.reduce(statistics, &process_record/2)
  end

  @spec process_record(Map.t(), Statistics.t()) :: Statistics.t()
  defp process_record(record, %Statistics{} = acc) do
    acc = %{acc | total: acc.total + 1}

    case GeolocationService.create_geolocation(record) do
      {:ok, _created_record} -> %{acc | accepted: acc.accepted + 1}
      {:error, _errored_record} -> %{acc | discarded: acc.discarded + 1}
    end
  end
end
