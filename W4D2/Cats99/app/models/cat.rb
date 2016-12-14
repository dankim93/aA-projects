class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(black white gray brown) }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    today = Time.now
    adjustment = (today.month > birth_date.month || (today.month == birth_date.month && today.day > birth_date.day)) ? 0 : 1
    today.year - birth_date.year - adjustment
  end

end
