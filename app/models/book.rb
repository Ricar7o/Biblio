class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :publisher, :title, :year, :cover_picture
end
