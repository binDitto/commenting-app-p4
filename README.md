# README

[PROJECT_04] Post app with commenting and users system < all self made

Models
- User
  * username
  * email
  * password_digest
  * has_many :comments
  * has_many :posts

- Post
  * title
  * body
  * belongs_to :user
  * has_many :comments

- Comment
  * body
  * belongs_to :user
  * belongs_to :post
