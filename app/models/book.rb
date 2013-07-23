class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :publisher, :title, :year, :picture, :user_id
  mount_uploader :picture, PictureUploader

  belongs_to  :user
end
