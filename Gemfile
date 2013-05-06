source "http://rubygems.org"

platforms :jruby do

  # With 2.2.1-2.2.3 things are broken
  gem 'neo4j-core',    '2.2.3'
  gem 'neo4j-wrapper', '2.2.3'

  # With 2.2.0 things work
  # gem 'neo4j-core',    '2.2.0'
  # gem 'neo4j-wrapper', '2.2.0'

  # Neo4j jars
  gem 'neo4j-community',  '1.8.2', :git =>'git://github.com/dnagir/neo4j-community.git'
  gem 'neo4j-advanced',   '1.8.2', :git =>'git://github.com/dnagir/neo4j-advanced.git'
  gem 'neo4j-enterprise', '1.8.2', :git =>'git://github.com/maxdemarzi/neo4j-enterprise.git'

  # Debugger
  gem 'ruby-debug'
end
