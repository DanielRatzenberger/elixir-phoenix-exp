defmodule DemoWeb.InhaltLive.FormComponent do
  use DemoWeb, :live_component

  alias Demo.Ausbildung

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage inhalt records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="inhalt-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:wochentag]} type="text" label="Wochentag" />
        <.input field={@form[:inhalt]} type="text" label="Inhalt" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Inhalt</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{inhalt: inhalt} = assigns, socket) do
    changeset = Ausbildung.change_inhalt(inhalt)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"inhalt" => inhalt_params}, socket) do
    changeset =
      socket.assigns.inhalt
      |> Ausbildung.change_inhalt(inhalt_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"inhalt" => inhalt_params}, socket) do
    save_inhalt(socket, socket.assigns.action, inhalt_params)
  end

  defp save_inhalt(socket, :edit, inhalt_params) do
    case Ausbildung.update_inhalt(socket.assigns.inhalt, inhalt_params) do
      {:ok, inhalt} ->
        notify_parent({:saved, inhalt})

        {:noreply,
         socket
         |> put_flash(:info, "Inhalt updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_inhalt(socket, :new, inhalt_params) do
    case Ausbildung.create_inhalt(inhalt_params) do
      {:ok, inhalt} ->
        notify_parent({:saved, inhalt})

        {:noreply,
         socket
         |> put_flash(:info, "Inhalt created successfully")
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
