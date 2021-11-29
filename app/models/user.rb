require "date"
require 'active_record'

class User < ActiveRecord::Base
    def to_displayable_string
        "#{id} #{name} #{email}"
    end

    def self.to_displayable_list
        all.map {|user| user.to_displayable_string }.join("\n")
    end

    def self.show_single(id)
        User.find(id).to_displayable_string
    end    

    def self.add_user(user_details)
        self.create!(name: user_details[:name], email: user_details[:email], password: user_details[:password])     
    end 
    
    def self.login(user_details)
        User.where(email: user_details[:email],password:user_details[:password]).present?
    end    
end