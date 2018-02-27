class Picture < ApplicationRecord
  DAYS_30 = 30 * (24 * 60 * 60)

  validates :artist, presence: true
  validates :title, length: { in: 3..20}
  validates :url, presence: true, uniqueness: true, format: { :with => URI.regexp, message: "must started with http" }

  def self.created_before30d
    time = Time.now - DAYS_30
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(year)
    Picture.where("cast(strftime('%Y', created_at) as int) = ?", year)
  end

end
