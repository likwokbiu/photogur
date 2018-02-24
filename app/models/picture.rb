class Picture < ApplicationRecord
  DAYS_30 = 30 * (24 * 60 * 60)

  def self.created_before30d
    time = Time.now - DAYS_30
    Picture.where("created_at < ?", time)
  end

end
