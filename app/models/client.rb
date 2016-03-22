class Client < ActiveRecord::Base
	has_many :purchase_historic

	validates :name, presence: true, 
                    length: { minimum: 5 }
    validates :login, presence: true,
    				length: { minimum: 5 }
    validates :password, presence: true, 
    				length: { minimum: 6 }
    validates :email, presence: true,
    				length: { minimum: 5 }
end
