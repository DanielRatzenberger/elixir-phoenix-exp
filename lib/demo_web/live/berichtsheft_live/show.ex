defmodule DemoWeb.BerichtsheftLive.Show do
  use DemoWeb, :live_view

  alias Demo.Ausbildung

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:berichtsheft, Ausbildung.get_berichtsheft!(id))}
  end

  defp page_title(:show), do: "Show Berichtsheft"
  defp page_title(:edit), do: "Edit Berichtsheft"
end
