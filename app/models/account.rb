class Account < ActiveRecord::Base
    has_many :tickets
    before_save { self.email = email.downcase }
    validates :fname, presence: true, length: { maximum: 50 }
    validates :lname, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX},
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_blank: true
    
    def self.search(search_for)
        Account.where("email = ?", search_for)
    end
  
    def self.idsearch(search_for)
        Account.where("id = ?", search_for)
    end
    
end
