class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visitors,
    -> { distinct },  #Proc.new { distinct }
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit




  def self.random_code
    short_url = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(short_url: short_url)
      short_url = SecureRandom::urlsafe_base64
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  def num_clicks
    visitors.select(:user_id).count
  end

  def num_uniques
    visitors.select(:user_id).count

  end

  def num_recent_uniques
    visitors.select(:user_id).where("visits.created_at > ?", 10.minutes.ago).count
  end

end
