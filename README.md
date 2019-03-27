# bookmark_manager

## User Stories
```
As a user
So I can see a list of bookmarks
We need to display a list of bookmarks
```

## Domain Model

## Setting up Database for storing Bookmarks
1. `brew install postgresql`
2. `psql postgres`
3. `CREATE DATABASE "bookmark_manager";`
4. `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));`

## Setting up a test database
1. `psql postgres`
2. `CREATE DATABASE "bookmark_manager_test";`
3. `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));`
