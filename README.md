1. Related to this bug report https://github.com/prisma/prisma/issues/10901
2. You'll need docker for this repo
3. Copy over .env.example to .env
   1. change as you need
4. Run the following command
   1. docker compose up --build
5. You can go into your docker container with command:
   1. `docker exec -it prisma_api bash`
6. Manually add to the database (you can connect to the database at localhost:1433)
   1. INSERT INTO local.dbo.Person (name) VALUES (N'George Washington');
      INSERT INTO local.dbo.Person (name) VALUES (N'Abe Lincoln');
      INSERT INTO local.dbo.Person (name) VALUES (N'John Adams');
   2. INSERT INTO local.dbo.Follows (followerId, followingId) VALUES (1, 2);
      INSERT INTO local.dbo.Follows (followerId, followingId) VALUES (1, 3);
7. Go to http://localhost:3000/persons/1
8. You will see that even though above you added 2 persons that George Washington is following, his `following` relationship is empty.
9. His `followers` relationship has 2 persons, but the records you added are not his `followers`, they should be under the `following` relationship.

