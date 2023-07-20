defmodule DemoWeb.InhaltLive.Show do
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
     |> assign(:inhalt, Ausbildung.get_inhalt!(id))}
  end

  defp page_title(:show), do: "Show Inhalt"
  defp page_title(:edit), do: "Edit Inhalt"
end
