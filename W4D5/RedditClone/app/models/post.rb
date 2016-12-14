class Post < ActiveRecord::Base
  validates :title, :sub_id, :author_id, presence: true
  validates :title, uniqueness: true

  has_many :postsubs,
  foreign_key: :post_id,
  class_name: :PostSub

  has_many :subs,
  through: :postsubs,
  source: :sub

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments,
    foreign_key: :post_id


end
