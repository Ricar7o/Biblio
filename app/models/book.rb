class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :publisher, :title, :year
end
