defmodule Demo.AusbildungTest do
  use Demo.DataCase

  alias Demo.Ausbildung

  describe "berichtshefte" do
    alias Demo.Ausbildung.Berichtsheft

    import Demo.AusbildungFixtures

    @invalid_attrs %{berichtsheftnummer: nil, datum_von: nil, datum_bis: nil, inhalt: nil}

    test "list_berichtshefte/0 returns all berichtshefte" do
      berichtsheft = berichtsheft_fixture()
      assert Ausbildung.list_berichtshefte() == [berichtsheft]
    end

    test "get_berichtsheft!/1 returns the berichtsheft with given id" do
      berichtsheft = berichtsheft_fixture()
      assert Ausbildung.get_berichtsheft!(berichtsheft.id) == berichtsheft
    end

    test "create_berichtsheft/1 with valid data creates a berichtsheft" do
      valid_attrs = %{berichtsheftnummer: 42, datum_von: ~D[2023-07-18], datum_bis: ~D[2023-07-18], inhalt: "some inhalt"}

      assert {:ok, %Berichtsheft{} = berichtsheft} = Ausbildung.create_berichtsheft(valid_attrs)
      assert berichtsheft.berichtsheftnummer == 42
      assert berichtsheft.datum_von == ~D[2023-07-18]
      assert berichtsheft.datum_bis == ~D[2023-07-18]
      assert berichtsheft.inhalt == "some inhalt"
    end

    test "create_berichtsheft/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ausbildung.create_berichtsheft(@invalid_attrs)
    end

    test "update_berichtsheft/2 with valid data updates the berichtsheft" do
      berichtsheft = berichtsheft_fixture()
      update_attrs = %{berichtsheftnummer: 43, datum_von: ~D[2023-07-19], datum_bis: ~D[2023-07-19], inhalt: "some updated inhalt"}

      assert {:ok, %Berichtsheft{} = berichtsheft} = Ausbildung.update_berichtsheft(berichtsheft, update_attrs)
      assert berichtsheft.berichtsheftnummer == 43
      assert berichtsheft.datum_von == ~D[2023-07-19]
      assert berichtsheft.datum_bis == ~D[2023-07-19]
      assert berichtsheft.inhalt == "some updated inhalt"
    end

    test "update_berichtsheft/2 with invalid data returns error changeset" do
      berichtsheft = berichtsheft_fixture()
      assert {:error, %Ecto.Changeset{}} = Ausbildung.update_berichtsheft(berichtsheft, @invalid_attrs)
      assert berichtsheft == Ausbildung.get_berichtsheft!(berichtsheft.id)
    end

    test "delete_berichtsheft/1 deletes the berichtsheft" do
      berichtsheft = berichtsheft_fixture()
      assert {:ok, %Berichtsheft{}} = Ausbildung.delete_berichtsheft(berichtsheft)
      assert_raise Ecto.NoResultsError, fn -> Ausbildung.get_berichtsheft!(berichtsheft.id) end
    end

    test "change_berichtsheft/1 returns a berichtsheft changeset" do
      berichtsheft = berichtsheft_fixture()
      assert %Ecto.Changeset{} = Ausbildung.change_berichtsheft(berichtsheft)
    end
  end

  describe "inhalte" do
    alias Demo.Ausbildung.Inhalt

    import Demo.AusbildungFixtures

    @invalid_attrs %{wochentag: nil, inhalt: nil}

    test "list_inhalte/0 returns all inhalte" do
      inhalt = inhalt_fixture()
      assert Ausbildung.list_inhalte() == [inhalt]
    end

    test "get_inhalt!/1 returns the inhalt with given id" do
      inhalt = inhalt_fixture()
      assert Ausbildung.get_inhalt!(inhalt.id) == inhalt
    end

    test "create_inhalt/1 with valid data creates a inhalt" do
      valid_attrs = %{wochentag: "some wochentag", inhalt: "some inhalt"}

      assert {:ok, %Inhalt{} = inhalt} = Ausbildung.create_inhalt(valid_attrs)
      assert inhalt.wochentag == "some wochentag"
      assert inhalt.inhalt == "some inhalt"
    end

    test "create_inhalt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ausbildung.create_inhalt(@invalid_attrs)
    end

    test "update_inhalt/2 with valid data updates the inhalt" do
      inhalt = inhalt_fixture()
      update_attrs = %{wochentag: "some updated wochentag", inhalt: "some updated inhalt"}

      assert {:ok, %Inhalt{} = inhalt} = Ausbildung.update_inhalt(inhalt, update_attrs)
      assert inhalt.wochentag == "some updated wochentag"
      assert inhalt.inhalt == "some updated inhalt"
    end

    test "update_inhalt/2 with invalid data returns error changeset" do
      inhalt = inhalt_fixture()
      assert {:error, %Ecto.Changeset{}} = Ausbildung.update_inhalt(inhalt, @invalid_attrs)
      assert inhalt == Ausbildung.get_inhalt!(inhalt.id)
    end

    test "delete_inhalt/1 deletes the inhalt" do
      inhalt = inhalt_fixture()
      assert {:ok, %Inhalt{}} = Ausbildung.delete_inhalt(inhalt)
      assert_raise Ecto.NoResultsError, fn -> Ausbildung.get_inhalt!(inhalt.id) end
    end

    test "change_inhalt/1 returns a inhalt changeset" do
      inhalt = inhalt_fixture()
      assert %Ecto.Changeset{} = Ausbildung.change_inhalt(inhalt)
    end
  end
end
