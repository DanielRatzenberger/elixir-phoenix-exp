defmodule DemoWeb.InhaltLive.Index do
  use DemoWeb, :live_view

  alias Demo.Ausbildung
  alias Demo.Ausbildung.Inhalt

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :inhalte, Ausbildung.list_inhalte())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Inhalt")
    |> assign(:inhalt, Ausbildung.get_inhalt!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Inhalt")
    |> assign(:inhalt, %Inhalt{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Inhalte")
    |> assign(:inhalt, nil)
  end

  @impl true
  def handle_info({DemoWeb.InhaltLive.FormComponent, {:saved, inhalt}}, socket) do
    {:noreply, stream_insert(socket, :inhalte, inhalt)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    inhalt = Ausbildung.get_inhalt!(id)
    {:ok, _} = Ausbildung.delete_inhalt(inhalt)

    {:noreply, stream_delete(socket, :inhalte, inhalt)}
  end
end
