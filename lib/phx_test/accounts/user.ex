defmodule PhxTest.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    embeds_many :colors, PhxTest.Accounts.Color, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> cast_embed(:colors)
    |> validate_required([:name])
  end
end

defmodule PhxTest.Accounts.Color do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :display_name, :string
    field :hex_code, :string

    timestamps()
  end

  @doc false
  def changeset(color, attrs) do
    color
    |> cast(attrs, [:display_name, :hex_code])
    |> validate_required([:display_name, :hex_code])
  end
end
