# southof-joplin-docker-attempt

Look, you can't think that docker being your ownly mechanism for deploying
things is a GOOD IDEA.  It's NOT!   It's a terrible idea.

I like Joplin, but think it should produce real build artifacts for deployment
outside of docker.  Call me crazy, but I should not need docker to host the
Joplin Server.

This project will output a tar ball for whatever is hosted on docker hub for
joplin server.  Thus freeing us from the need to run docker for this purpose.

Plan is to eventually add some docs for how to host on a debian/ubuntu
system.
