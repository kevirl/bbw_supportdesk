class Ticket < ActiveRecord::Base
  belongs_to :account
  validates :account_id, presence: true
  
  def self.search(search_for)
    Ticket.where("email = ?", search_for)
  end
  
end
