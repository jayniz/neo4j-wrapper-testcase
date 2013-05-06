require 'bundler'
Bundler.require

class User
  include Neo4j::NodeMixin
  rule(:all, :functions => Neo4j::Wrapper::Rule::Functions::Size.new)
end

class Movie
  include Neo4j::NodeMixin
  rule(:all, :functions => Neo4j::Wrapper::Rule::Functions::Size.new)
end

class Like
  include Neo4j::RelationshipMixin
end

# Scope
user, movie, rel = nil, nil, nil

# Create nodes
Neo4j::Transaction.run do
  user = User.new(:name => 'Guergen')
  movie = Movie.new(:name => 'Matrox')
end

# Create relationship
Neo4j::Transaction.run do
  rel = Like.new(:likes, user, movie, rating: 8.0)
end

# Make sure things are ok
all_count = user.rels(:outgoing, :likes).count
to_other_count = user.rels(:outgoing, :likes).to_other(movie).count
its_the_same_node = user.rels(:outgoing, :likes).first.end_node == movie
result = to_other_count == 1 ? "OK" : "BROKEN"

puts "~"*72
puts "user:  #{user.inspect}"
puts "movie: #{movie.inspect}"
puts "rel:   #{rel.inspect}"
puts "user.rels(:outgoing, :likes).count:                   #{all_count}"
puts "user.rels(:outgoing, :likes).to_other(movie).count:   #{to_other_count}"
puts "user.rels(:outgoing, :likes).first.end_node == movie: #{its_the_same_node}"
puts "-"*72
puts "Test result: #{result}"
puts "\n"*2

# Can't believe it? Try the debugger:
# debugger; 1
