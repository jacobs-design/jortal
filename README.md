# Jacobs Institute Project Portal
[![Code Climate](https://codeclimate.com/github/jacobs-design/jortal/badges/gpa.svg)](https://codeclimate.com/github/jacobs-design/jortal) [![Build Status](https://travis-ci.org/jacobs-design/jortal.svg?branch=master)](https://travis-ci.org/jacobs-design/jortal)

Short interview video: https://www.youtube.com/watch?v=4FNNx8i3IuE

# Installation

First, you'll need to clone the repository. Run `git clone https://github.com/jacobs-design/jortal.git` where you want the folder to be.

Then, go into the repository and run the command `./bin/setup`.

When it finishes, you'll need to add your S3 secret keys to `config/application`.
It should be in this format:
```
AWS_ACCESS_KEY: "MyAccessKey"
AWS_SECRET_KEY: "MySecretKeys"
AWS_BUCKET: "MyBucket"
```

If you'd like to run it locally, type `rails s`. You may also need to run some additional commands if you want to connect it to a service like Heroku.
