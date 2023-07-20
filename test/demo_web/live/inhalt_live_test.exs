defmodule DemoWeb.InhaltLiveTest do
  use DemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import Demo.AusbildungFixtures

  @create_attrs %{wochentag: "some wochentag", inhalt: "some inhalt"}
  @update_attrs %{wochentag: "some updated wochentag", inhalt: "some updated inhalt"}
  @invalid_attrs %{wochentag: nil, inhalt: nil}

  defp create_inhalt(_) do
    inhalt = inhalt_fixture()
    %{inhalt: inhalt}
  end

  describe "Index" do
    setup [:create_inhalt]

    test "lists all inhalte", %{conn: conn, inhalt: inhalt} do
      {:ok, _index_live, html} = live(conn, ~p"/inhalte")

      assert html =~ "Listing Inhalte"
      assert html =~ inhalt.wochentag
    end

    test "saves new inhalt", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/inhalte")

      assert index_live |> element("a", "New Inhalt") |> render_click() =~
               "New Inhalt"

      assert_patch(index_live, ~p"/inhalte/new")

      assert index_live
             |> form("#inhalt-form", inhalt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#inhalt-form", inhalt: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/inhalte")

      html = render(index_live)
      assert html =~ "Inhalt created successfully"
      assert html =~ "some wochentag"
    end

    test "updates inhalt in listing", %{conn: conn, inhalt: inhalt} do
      {:ok, index_live, _html} = live(conn, ~p"/inhalte")

      assert index_live |> element("#inhalte-#{inhalt.id} a", "Edit") |> render_click() =~
               "Edit Inhalt"

      assert_patch(index_live, ~p"/inhalte/#{inhalt}/edit")

      assert index_live
             |> form("#inhalt-form", inhalt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#inhalt-form", inhalt: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/inhalte")

      html = render(index_live)
      assert html =~ "Inhalt updated successfully"
      assert html =~ "some updated wochentag"
    end

    test "deletes inhalt in listing", %{conn: conn, inhalt: inhalt} do
      {:ok, index_live, _html} = live(conn, ~p"/inhalte")

      assert index_live |> element("#inhalte-#{inhalt.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#inhalte-#{inhalt.id}")
    end
  end

  describe "Show" do
    setup [:create_inhalt]

    test "displays inhalt", %{conn: conn, inhalt: inhalt} do
      {:ok, _show_live, html} = live(conn, ~p"/inhalte/#{inhalt}")

      assert html =~ "Show Inhalt"
      assert html =~ inhalt.wochentag
    end

    test "updates inhalt within modal", %{conn: conn, inhalt: inhalt} do
      {:ok, show_live, _html} = live(conn, ~p"/inhalte/#{inhalt}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Inhalt"

      assert_patch(show_live, ~p"/inhalte/#{inhalt}/show/edit")

      assert show_live
             |> form("#inhalt-form", inhalt: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#inhalt-form", inhalt: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/inhalte/#{inhalt}")

      html = render(show_live)
      assert html =~ "Inhalt updated successfully"
      assert html =~ "some updated wochentag"
    end
  end
end
