1. Run the following command
   1. docker compose up --build
   2. copy over .env.example to .env
      1. change as you need
   3. Manually add to the database
      1. INSERT INTO local.dbo.Person (name) VALUES (N'George Washington');
         INSERT INTO local.dbo.Person (name) VALUES (N'Abe Lincoln');
         INSERT INTO local.dbo.Person (name) VALUES (N'John Adams');
      2. INSERT INTO local.dbo.Follows (followerId, followingId) VALUES (1, 2);
         INSERT INTO local.dbo.Follows (followerId, followingId) VALUES (1, 3);

