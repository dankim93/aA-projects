class Sub < ActiveRecord::Base
  validates :title, :description, :moderator_id, presence: true
  validates :title, uniqueness: true

  has_many :postsubs,
    foreign_key: :sub_id,
    class_name: :PostSub

  has_many :posts,
  through: :postsubs,
  source: :post


end
