class Contact < ActiveRecord::Base
    has_many :email_addresses
end
