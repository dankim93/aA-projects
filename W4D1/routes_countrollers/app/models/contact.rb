class Contact < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => { :scope => :email }
  validates :email, :presence => true, :uniqueness => { :scope => :user_id }

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :contact_share,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare

  has_many :shared_users,
    through: :contact_share,
    source: :user
end
