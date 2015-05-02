# Jacobs Institute Project Portal
[![Code Climate](https://codeclimate.com/github/jacobs-design/jortal/badges/gpa.svg)](https://codeclimate.com/github/jacobs-design/jortal) [![Build Status](https://travis-ci.org/jacobs-design/jortal.svg?branch=master)](https://travis-ci.org/jacobs-design/jortal)

Short interview video: https://www.youtube.com/watch?v=4FNNx8i3IuE

# Installation

Run the command `./bin/setup` in the root directory of the repository.

When it finishes, you'll need to add your S3 secret keys to `config/application`.
It should be in this format:
> AWS_ACCESS_KEY: "MyAccessKey"
> AWS_SECRET_KEY: "MySecretKeys"
> AWS_BUCKET: "MyBucket"
