class Movie < ActiveRecord::Base
   attr_accessible :title, :rating, :description, :release_date
  #which columns do you want to be translated?
   translates :title, :rating, :description, :release_date 
end


