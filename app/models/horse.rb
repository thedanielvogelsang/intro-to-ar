class Horse < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :breed

  def self.total_winnings?(jockey_id)
    Horse.where(jockey_id: jockey_id).sum(:total_winnings)
  end
end
