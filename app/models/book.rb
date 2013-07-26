class Book < ActiveRecord::Base
  attr_accessible :ISBN, :author, :publisher, :title, :year, :picture, :remote_cover, :description, :user_id
  mount_uploader :picture, PictureUploader

  belongs_to    :user

  validates     :ISBN, presence: true

  before_save   :check_against_goodreads

  private

  def check_against_goodreads
    gr = Goodreads.new

    # begin
      book = gr.book_by_isbn(self.ISBN)
      if self.author.empty?
        if book[:authors][:author].first[0] == 'id'
          self.author = book[:authors][:author][:name]
        else
          self.author = book[:authors][:author][0][:name]
        end
      end

      self.publisher = book[:publisher] if self.publisher.empty?
      self.title = book[:title] if self.title.empty?
      self.year = book[:publication_year].to_i if self.year.nil?
      self.remote_cover = book[:image_url] if self.picture.to_s == ''
      self.description = book[:description] if self.description.empty?
    # rescue
    #   logger.error "Error in fetching from Goodreads API."
    # end

  end

end