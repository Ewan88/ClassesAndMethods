require 'pry'

class Student

  attr_accessor :name, :cohort

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def name()
    return @name
  end

  def cohort()
    return @cohort
  end

  def talk()
    return "I can talk!"
  end

  def fav_lang(lang)
    return "I love " + lang
  end

end

class Team

  attr_accessor :name, :players, :coach, :points

  def initialize(name, players, coach)
    @name = name
    @players = players
    @coach = coach
    @points = 0
  end

  def name
    return @name
  end

  def players
    return @players
  end

  def coach
    return @coach
  end

  def update_coach(new_coach)
    @coach = new_coach
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def find_player(name_to_find)
    @players.include?(name_to_find)
  end

  def update_points(result)
    if result == "win"
      @points += 1
    end
    return @points
  end

end

class Library

  attr_accessor :books

  def initialize(books)
    @books = books
  end

  def display_books()
    return @books
  end

  def get_info(title)
    for book in @books
      if book[:title] = title
        return book
      end
    end
  end

  def get_rental_details(title)
    for book in @books
      if book[:title] = title
        return book[:rental_details]
      end
    end
  end

  def add_book(title)
    display_books.push({title: title, rental_details: {
      student_name: "", date: "" } } )
  end

  def change_details(title, student, date)
    for book in @books
      if book[:title] = title
        book[:rental_details][:student_name] = student
        book[:rental_details][:date] = date
      end
    end
  end

end
