class Url < ActiveRecord::Base
  validates_presence_of :link

  after_create :generate_short_url

  def generate_short_url
    self.short_link = self.id.to_s(6)
    self.save!
  end

  def update_clicks
    self.clicks += 1
    self.save!
  end
end