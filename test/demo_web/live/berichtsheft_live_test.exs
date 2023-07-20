defmodule DemoWeb.BerichtsheftLiveTest do
  use DemoWeb.ConnCase

  import Phoenix.LiveViewTest
  import Demo.AusbildungFixtures

  @create_attrs %{berichtsheftnummer: 42, datum_von: "2023-07-18", datum_bis: "2023-07-18", inhalt: "some inhalt"}
  @update_attrs %{berichtsheftnummer: 43, datum_von: "2023-07-19", datum_bis: "2023-07-19", inhalt: "some updated inhalt"}
  @invalid_attrs %{berichtsheftnummer: nil, datum_von: nil, datum_bis: nil, inhalt: nil}

  defp create_berichtsheft(_) do
    berichtsheft = berichtsheft_fixture()
    %{berichtsheft: berichtsheft}
  end

  describe "Index" do
    setup [:create_berichtsheft]

    test "lists all berichtshefte", %{conn: conn, berichtsheft: berichtsheft} do
      {:ok, _index_live, html} = live(conn, ~p"/berichtshefte")

      assert html =~ "Listing Berichtshefte"
      assert html =~ berichtsheft.inhalt
    end

    test "saves new berichtsheft", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/berichtshefte")

      assert index_live |> element("a", "New Berichtsheft") |> render_click() =~
               "New Berichtsheft"

      assert_patch(index_live, ~p"/berichtshefte/new")

      assert index_live
             |> form("#berichtsheft-form", berichtsheft: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#berichtsheft-form", berichtsheft: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/berichtshefte")

      html = render(index_live)
      assert html =~ "Berichtsheft created successfully"
      assert html =~ "some inhalt"
    end

    test "updates berichtsheft in listing", %{conn: conn, berichtsheft: berichtsheft} do
      {:ok, index_live, _html} = live(conn, ~p"/berichtshefte")

      assert index_live |> element("#berichtshefte-#{berichtsheft.id} a", "Edit") |> render_click() =~
               "Edit Berichtsheft"

      assert_patch(index_live, ~p"/berichtshefte/#{berichtsheft}/edit")

      assert index_live
             |> form("#berichtsheft-form", berichtsheft: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#berichtsheft-form", berichtsheft: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/berichtshefte")

      html = render(index_live)
      assert html =~ "Berichtsheft updated successfully"
      assert html =~ "some updated inhalt"
    end

    test "deletes berichtsheft in listing", %{conn: conn, berichtsheft: berichtsheft} do
      {:ok, index_live, _html} = live(conn, ~p"/berichtshefte")

      assert index_live |> element("#berichtshefte-#{berichtsheft.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#berichtshefte-#{berichtsheft.id}")
    end
  end

  describe "Show" do
    setup [:create_berichtsheft]

    test "displays berichtsheft", %{conn: conn, berichtsheft: berichtsheft} do
      {:ok, _show_live, html} = live(conn, ~p"/berichtshefte/#{berichtsheft}")

      assert html =~ "Show Berichtsheft"
      assert html =~ berichtsheft.inhalt
    end

    test "updates berichtsheft within modal", %{conn: conn, berichtsheft: berichtsheft} do
      {:ok, show_live, _html} = live(conn, ~p"/berichtshefte/#{berichtsheft}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Berichtsheft"

      assert_patch(show_live, ~p"/berichtshefte/#{berichtsheft}/show/edit")

      assert show_live
             |> form("#berichtsheft-form", berichtsheft: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#berichtsheft-form", berichtsheft: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/berichtshefte/#{berichtsheft}")

      html = render(show_live)
      assert html =~ "Berichtsheft updated successfully"
      assert html =~ "some updated inhalt"
    end
  end
end
