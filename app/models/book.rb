class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :publisher, :title, :year, :picture
  mount_uploader :picture, PictureUploader
end
