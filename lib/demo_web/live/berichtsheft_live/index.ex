defmodule DemoWeb.BerichtsheftLive.Index do
  use DemoWeb, :live_view

  alias Demo.Ausbildung
  alias Demo.Ausbildung.Berichtsheft

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :berichtshefte, Ausbildung.list_berichtshefte())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Berichtsheft")
    |> assign(:berichtsheft, Ausbildung.get_berichtsheft!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Berichtsheft")
    |> assign(:berichtsheft, %Berichtsheft{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Berichtshefte")
    |> assign(:berichtsheft, nil)
  end

  @impl true
  def handle_info({DemoWeb.BerichtsheftLive.FormComponent, {:saved, berichtsheft}}, socket) do
    {:noreply, stream_insert(socket, :berichtshefte, berichtsheft)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    berichtsheft = Ausbildung.get_berichtsheft!(id)
    {:ok, _} = Ausbildung.delete_berichtsheft(berichtsheft)

    {:noreply, stream_delete(socket, :berichtshefte, berichtsheft)}
  end
end
