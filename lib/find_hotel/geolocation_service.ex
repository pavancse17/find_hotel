defmodule FindHotel.GeolocationService do
  @moduledoc """
  The GeolocationService context.
  """

  import Ecto.Query, warn: false
  alias FindHotel.Repo

  alias FindHotel.GeolocationService.Geolocation

  @doc """
  Returns the list of geolocations.

  ## Examples

      iex> list_geolocations()
      [%Geolocation{}, ...]

  """
  def list_geolocations do
    Repo.all(Geolocation)
  end

  @doc """
  Gets a single geolocation.

  Raises `Ecto.NoResultsError` if the Geolocation does not exist.

  ## Examples

      iex> get_geolocation!(123)
      %Geolocation{}

      iex> get_geolocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_geolocation!(id), do: Repo.get!(Geolocation, id)

  @doc """
  Gets a single geolocation.

  Returns nil if the Geolocation does not exist.

  ## Examples

      iex> get_geolocation_by(ip_address: "123.232.323.343")
      %Geolocation{}

      iex> get_geolocation_by(ip_address: "456")
      nil

  """
  def get_geolocation_by(opts), do: Repo.get_by(Geolocation, opts)

  @doc """
  Creates a geolocation.

  ## Examples

      iex> create_geolocation(%{field: value})
      {:ok, %Geolocation{}}

      iex> create_geolocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_geolocation(attrs \\ %{}) do
    %Geolocation{}
    |> Geolocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a geolocation.

  ## Examples

      iex> update_geolocation(geolocation, %{field: new_value})
      {:ok, %Geolocation{}}

      iex> update_geolocation(geolocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_geolocation(%Geolocation{} = geolocation, attrs) do
    geolocation
    |> Geolocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a geolocation.

  ## Examples

      iex> delete_geolocation(geolocation)
      {:ok, %Geolocation{}}

      iex> delete_geolocation(geolocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_geolocation(%Geolocation{} = geolocation) do
    Repo.delete(geolocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking geolocation changes.

  ## Examples

      iex> change_geolocation(geolocation)
      %Ecto.Changeset{data: %Geolocation{}}

  """
  def change_geolocation(%Geolocation{} = geolocation, attrs \\ %{}) do
    Geolocation.changeset(geolocation, attrs)
  end
end
