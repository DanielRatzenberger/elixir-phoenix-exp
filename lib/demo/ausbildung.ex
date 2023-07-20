defmodule Demo.Ausbildung do
  @moduledoc """
  The Ausbildung context.
  """

  import Ecto.Query, warn: false
  alias Demo.Repo

  alias Demo.Ausbildung.Berichtsheft

  @doc """
  Returns the list of berichtshefte.

  ## Examples

      iex> list_berichtshefte()
      [%Berichtsheft{}, ...]

  """
  def list_berichtshefte do
    Repo.all(Berichtsheft)
  end

  @doc """
  Gets a single berichtsheft.

  Raises `Ecto.NoResultsError` if the Berichtsheft does not exist.

  ## Examples

      iex> get_berichtsheft!(123)
      %Berichtsheft{}

      iex> get_berichtsheft!(456)
      ** (Ecto.NoResultsError)

  """
  def get_berichtsheft!(id), do: Repo.get!(Berichtsheft, id)

  @doc """
  Creates a berichtsheft.

  ## Examples

      iex> create_berichtsheft(%{field: value})
      {:ok, %Berichtsheft{}}

      iex> create_berichtsheft(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_berichtsheft(attrs \\ %{}) do
    %Berichtsheft{}
    |> Berichtsheft.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a berichtsheft.

  ## Examples

      iex> update_berichtsheft(berichtsheft, %{field: new_value})
      {:ok, %Berichtsheft{}}

      iex> update_berichtsheft(berichtsheft, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_berichtsheft(%Berichtsheft{} = berichtsheft, attrs) do
    berichtsheft
    |> Berichtsheft.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a berichtsheft.

  ## Examples

      iex> delete_berichtsheft(berichtsheft)
      {:ok, %Berichtsheft{}}

      iex> delete_berichtsheft(berichtsheft)
      {:error, %Ecto.Changeset{}}

  """
  def delete_berichtsheft(%Berichtsheft{} = berichtsheft) do
    Repo.delete(berichtsheft)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking berichtsheft changes.

  ## Examples

      iex> change_berichtsheft(berichtsheft)
      %Ecto.Changeset{data: %Berichtsheft{}}

  """
  def change_berichtsheft(%Berichtsheft{} = berichtsheft, attrs \\ %{}) do
    Berichtsheft.changeset(berichtsheft, attrs)
  end

  alias Demo.Ausbildung.Inhalt

  @doc """
  Returns the list of inhalte.

  ## Examples

      iex> list_inhalte()
      [%Inhalt{}, ...]

  """
  def list_inhalte do
    Repo.all(Inhalt)
  end

  @doc """
  Gets a single inhalt.

  Raises `Ecto.NoResultsError` if the Inhalt does not exist.

  ## Examples

      iex> get_inhalt!(123)
      %Inhalt{}

      iex> get_inhalt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inhalt!(id), do: Repo.get!(Inhalt, id)

  @doc """
  Creates a inhalt.

  ## Examples

      iex> create_inhalt(%{field: value})
      {:ok, %Inhalt{}}

      iex> create_inhalt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inhalt(attrs \\ %{}) do
    %Inhalt{}
    |> Inhalt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inhalt.

  ## Examples

      iex> update_inhalt(inhalt, %{field: new_value})
      {:ok, %Inhalt{}}

      iex> update_inhalt(inhalt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inhalt(%Inhalt{} = inhalt, attrs) do
    inhalt
    |> Inhalt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inhalt.

  ## Examples

      iex> delete_inhalt(inhalt)
      {:ok, %Inhalt{}}

      iex> delete_inhalt(inhalt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inhalt(%Inhalt{} = inhalt) do
    Repo.delete(inhalt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inhalt changes.

  ## Examples

      iex> change_inhalt(inhalt)
      %Ecto.Changeset{data: %Inhalt{}}

  """
  def change_inhalt(%Inhalt{} = inhalt, attrs \\ %{}) do
    Inhalt.changeset(inhalt, attrs)
  end
end
