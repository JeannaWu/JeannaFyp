class Order < ActiveRecord::Base
	GENDERS = [ "Female", "Male"]
            validates :gender, :inclusion => GENDERS
end
