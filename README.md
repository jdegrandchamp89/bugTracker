# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Bugs Testing:
  1. Title and description cannot be blank whenever a bug is created or edited.
  2. Issue_type, priority and status must have valid values (you should represent these values as enumerated types.)
  3. The default value of issue_type should be feature.
  4. The default value of priority should be medium.
  5. The default value of status should be open.

Users Testing:
  1. lname, fname, email cannot be blank whenever an author is created or edited.
  2. email must be unique and be a valid format for an email address.
  3. thumbnail must end with either .png, .jpg, or .gif. It is ok to leave the thumbnail field blank.