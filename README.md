# Typing-Royale

## What is Typing-Royale?
A retro themed typing game that allows players to compete head to head over the web.


## Demo
![Typing-Royale Homepage](https://i.imgur.com/rdIjlOS.png)

![Typing-Royale game gif](https://i.imgur.com/eEvdXsb.gif)


## How does it work?

### Back-End

Typing-Royale's API is built with Ruby on Rails, utilizing JWT and BCrypt for security, and PostgreSQL for its database. ActionCable is utilized to allow for real-time progress updates between players.

### Front-End

[Link to Front-End Repo](https://github.com/wukrit/typing-royale-frontend)

Typing is built using React as its front-end framework.

React hooks are utilized in order to manage stateful logic and to create a cohesive UX.

## Installation

    Clone repo and CD into the directory
    bundle install
    run rails db:create to create your postgres database
    run rails db:migrate to bring up migrations
    run rails db:seed to seed data for shops and items
    run rails s to start the server

Make sure to visit the repo for the frontend and follow those instructions as well.
