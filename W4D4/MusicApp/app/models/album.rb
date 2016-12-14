class Album < ActiveRecord::Base
  has_many :tracks, dependent: :destroy,
    foreign_key: :album_id

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
end
