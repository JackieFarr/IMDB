require_relative("../db/sql_runner")

class Actor

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "INSERT INTO actors
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    actor = SqlRunner.run(sql, values).first
    @id = actor["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM actors"
    SqlRunner.run(sql)
  end

  def update()
    sql = "
      UPDATE actors
      set(
        first_name,
        last_name
      ) = ($1, $2)
      WHERE id = $3;
      "
    values = [
      @first_name,
      @last_name,
      @id
    ]
    SqlRunner.run(sql, values)
  end

  def movies()
    sql = "SELECT movies.* FROM movies
    INNER JOIN roles
    ON roles.movie_id = movies.id
    WHERE roles.actor_id = $1"

    results = SqlRunner.run(sql, [@id])
    movies = results.map do |order_hash| Movie.new(order_hash)
    end
  end

end
