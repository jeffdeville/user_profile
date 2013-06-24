class Address < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zip, :user_id
  belongs_to :user
end
