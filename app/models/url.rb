class Url < ActiveRecord::Base
  validates_presence_of :link

  def generate_short_url
    self.short_link = self.id.to_s(36)
    self.save!
  end
end