# Blog site

Website where you can read and create your own blogs posts.

## Overview

With this blog site you can read, write, edit and comment blog posts. It is for people who want to share their ideas and interests. At the moment application is up and running. test_schema.sql categories are a bit silly, for example under clothing you get avokado recipe. But it gets you up and running.

## Features

- Read/Write blog posts
- Login/logout and delete your user account
- Edit blog posts
- Filter posts to only see what you are interested in (eg. travelling)
- Comment posts

## Technologies Used

- Python
- Postgresql
- Javascript

## Getting Started

Important!

Schema.sql alters tablenames users, posts, comments, tags and post_tag if it exists. After that it will create new tables under respective names. If you get conflicts with database you might need to drop your postgresql tables before you can run this app.

1. Clone repository to your computer

   https://github.com/akselipu/blogsite.git

2. Go to root file of repository folder and create .env file. In .env file  put DATABASE_URL="your/path/to/postgres" and SECRET_KEY="your_secret_key"

3. Activate virtual environment

$ python3 -m venv venv

$ source venv/bin/activate

$ pip install -r ./requirements.txt

4. Define schema with
   
   $ psql < schema.sql
   
   If it doesnt work you can try with \i /absolute/path/to/your/schema.sql

5. Start application

   $ flask run

6. Go to application via local host

7. If you want you can add content to application with

   $ psql < test_schema.sql
