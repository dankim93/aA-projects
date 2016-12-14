class PostSub < ActiveRecord::Base

  belongs_to :post,
  foreign_key: :post_id

  belongs_to :sub,
  foreign_key: :sub_id
end
