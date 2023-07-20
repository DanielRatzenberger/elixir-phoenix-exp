defmodule DemoWeb.BerichtsheftLive.FormComponent do
  use DemoWeb, :live_component

  alias Demo.Ausbildung

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage berichtsheft records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="berichtsheft-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:berichtsheftnummer]} type="number" label="Berichtsheftnummer" />
        <.input field={@form[:datum_von]} type="date" label="Datum von" />
        <.input field={@form[:datum_bis]} type="date" label="Datum bis" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Berichtsheft</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{berichtsheft: berichtsheft} = assigns, socket) do
    changeset = Ausbildung.change_berichtsheft(berichtsheft)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"berichtsheft" => berichtsheft_params}, socket) do
    changeset =
      socket.assigns.berichtsheft
      |> Ausbildung.change_berichtsheft(berichtsheft_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"berichtsheft" => berichtsheft_params}, socket) do
    save_berichtsheft(socket, socket.assigns.action, berichtsheft_params)
  end

  defp save_berichtsheft(socket, :edit, berichtsheft_params) do
    case Ausbildung.update_berichtsheft(socket.assigns.berichtsheft, berichtsheft_params) do
      {:ok, berichtsheft} ->
        notify_parent({:saved, berichtsheft})

        {:noreply,
         socket
         |> put_flash(:info, "Berichtsheft updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_berichtsheft(socket, :new, berichtsheft_params) do
    case Ausbildung.create_berichtsheft(berichtsheft_params) do
      {:ok, berichtsheft} ->
        notify_parent({:saved, berichtsheft})

        {:noreply,
         socket
         |> put_flash(:info, "Berichtsheft created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
