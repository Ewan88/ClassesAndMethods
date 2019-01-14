require ('minitest/autorun')
require ('minitest/rg')
require_relative('../classes_lab.rb')

class TestStudent < MiniTest::Test

  def test_name
    student = Student.new("Bob", "G11")
    assert_equal("Bob", student.name)
  end

  def test_cohort
    student = Student.new("Bob", "G11")
    assert_equal("G11", student.cohort)
  end

  def test_talk
    student = Student.new("Bob", "G11")
    assert_equal("I can talk!", student.talk)
  end

  def test_fav_lang
    student = Student.new("Bob", "G11")
    assert_equal("I love C", student.fav_lang("C"))
  end

end

class TestTeam < MiniTest::Test

  def test_name
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal("Bob Rockets", team.name)
  end

  def test_players
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal(["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], team.players)
  end

  def test_coach
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal("Bob", team.coach)
  end

  def test_update_coach
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal("Heinrich Himmler",  team.update_coach("Heinrich Himmler"))
  end

  def test_add_player
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    team.add_player("Julius Caesar")
    assert_equal(5, team.players.length)
  end

  def test_find_player
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal(false, team.find_player("Saruman"))
  end

  def test_update_points
    team = Team.new("Bob Rockets", ["Nigel", "Spartacus", "Kamal", "Haile Sallaise"], "Bob")
    assert_equal(1, team.update_points("win"))
  end

end

class TestLibrary < MiniTest::Test

  def test_display_books
    library = Library.new ( [ {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16" } }, ] )
    assert_equal( [ {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16" } } ], library.display_books)
    end

    def test_get_info
      library = Library.new ( [ {
          title: "lord_of_the_rings",
          rental_details: {
          student_name: "Jeff",
          date: "01/12/16" } },
          { title: "lord_of_the_flies",
          rental_details: {
          student_name: "Bob",
          date: "01/12/19" } }
          ] )
      assert_equal( {
        title: "lord_of_the_rings",
        rental_details: {
          student_name: "Jeff",
          date: "01/12/16" } },
        library.get_info("lord_of_the_rings"))
      end

      def test_get_rental_details
        library = Library.new( [
          { title: "lord_of_the_rings",
          rental_details: {
          student_name: "Jeff",
          date: "01/12/16" } },
          { title: "lord_of_the_flies",
          rental_details: {
          student_name: "Bob",
          date: "01/12/19" } } ] )

          assert_equal( {
            student_name: "Jeff",
            date: "01/12/16" } ,
            library.get_rental_details("lord_of_the_rings") )
        end

        def test_add_book
          library = Library.new( [
            { title: "lord_of_the_rings",
            rental_details: { student_name: "Jeff",
            date: "01/12/16" } } ] )
          library.add_book("lord_of_the_flies")
          assert_equal(2, library.display_books.length )
        end

        def test_change_details
          library = Library.new( [
            { title: "lord_of_the_rings",
            rental_details: { student_name: "Jeff",
            date: "01/12/16" } } ] )
          library.change_details("lord_of_the_rings",
            "George", "01/12/19")
          assert_equal( [
            { title: "lord_of_the_rings",
            rental_details: { student_name: "George",
            date: "01/12/19" } } ], library.display_books)
        end


  end
