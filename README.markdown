Changed relationship behaviour:
===============================

Upgrading from neo4j-wrapper/neo4j-core 2.2.0 to 2.2.1-2.2.3
breaks the relationship lookup from one node to another node.
This demo creates two nodes, a connection between them, and
then tries to do `from_node.rels(:outgoing, :type).to_other(other_node)`
which fails. `from_node.rels(:outgoing, :type)` returns the 
created connection just fine.

To see the demo fail:
-------------------------

    source .rvmrc
    gem install bundler
    bundle
    ./run.sh

The run.sh script will delete the `db/` dir (so you can
repeatedly test), run the test and present you with the
results.

To see the demo work:
---------------------

Edit Gemfile and uncomment as instructed to downgrade
neo4j-wrapper and neo4j-core from 2.2.3 to 2.2.0 and
run

    bundle update neo4j-core neo4j-wrapper


Output on my machine (with 2.2.3):
----------------------------------

    [...]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    user:  #<User:0x65bc3ae7
    @_java_node=#<Java::OrgNeo4jKernelImplCore::NodeProxy:0x7544497e>>
    movie: #<Movie:0x101b8d82
    @_java_node=#<Java::OrgNeo4jKernelImplCore::NodeProxy:0x65c66812>>
    rel:   #<Like:0x1e881278
    @_java_rel=#<Java::OrgNeo4jKernelImplCore::RelationshipProxy:0x55e3c942>>
    user.rels(:outgoing, :likes).count:                   1
    user.rels(:outgoing, :likes).to_other(movie).count:   0
    user.rels(:outgoing, :likes).first.end_node == movie: true
    ------------------------------------------------------------------------
    Test result: BROKEN

Output on my machine (with 2.2.0):
----------------------------------

    [...]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    user:  #<User:0x66987c7d
    @_java_node=#<Java::OrgNeo4jKernelImplCore::NodeProxy:0x50b20090>>
    movie: #<Movie:0x59026e12
    @_java_node=#<Java::OrgNeo4jKernelImplCore::NodeProxy:0x54283253>>
    rel:   #<Like:0x4722f17b
    @_java_rel=#<Java::OrgNeo4jKernelImplCore::RelationshipProxy:0x5f450701>>
    user.rels(:outgoing, :likes).count:                   1
    user.rels(:outgoing, :likes).to_other(movie).count:   1
    user.rels(:outgoing, :likes).first.end_node == movie: true
    ------------------------------------------------------------------------
    Test result: OK
