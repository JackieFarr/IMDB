require_relative ("./models/movie.rb")
require_relative ("./models/actor.rb")
require_relative ("./models/role.rb")
require( 'pry-byebug' )


Movie.delete_all()
Actor.delete_all()
Role.delete_all()

movie1 = Movie.new({
  "title" => "Fight Club",
  "genre" => "Drama"
  })

movie2 = Movie.new({
  "title" => "The Nun",
  "genre" => "Horror"
  })

  movie1.save()
  movie2.save()

  movie1.title = "Titanic"
  movie1.update

actor1 = Actor.new({
  "first_name" => "Brad",
  "last_name" => "Pitt"
  })

actor2 = Actor.new({
  "first_name" => "Edward",
  "last_name" => "Norton"
  })

actor3 = Actor.new({
  "first_name" => "Taissa",
  "last_name" => "Farmiga"
  })

actor4 = Actor.new({
  "first_name" => "Jonas",
  "last_name" => "Bloquet"
  })

  actor1.save()
  actor2.save()
  actor3.save()
  actor4.save()

  actor1.first_name = "Paul"
  actor1.update

role1 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor1.id,
  "fee" => 1000000
  })

role2 = Role.new({
  "movie_id" => movie1.id,
  "actor_id" => actor2.id,
  "fee" => 500000
  })

role3 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor3.id,
  "fee" => 1000000
  })

role4 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor1.id,
  "fee" => 50000
  })

role5 = Role.new({
  "movie_id" => movie2.id,
  "actor_id" => actor4.id,
  "fee" => 250000
  })

role1.save()
role2.save()
role3.save()
role4.save()
role5.save()

role1.fee = 2000000
role1.update

binding.pry
nil
