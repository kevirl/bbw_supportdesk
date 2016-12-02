class Ticket < ActiveRecord::Base
  belongs_to :account
  validates :account_id, presence: true
  validates :title , presence: true
  
  def self.search(search_for)
    Ticket.where("email = ?", search_for)
  end
  
  def self.idsearch(search_for)
    Ticket.where("id = ?", search_for)
  end
  
  def self.catsearch(search_for)
    Ticket.where("category = ?", search_for)
  end
  
  def self.prodsearch(search_for)
    Ticket.where("product = ?", search_for)
  end
  
end
