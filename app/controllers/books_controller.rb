class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    if user_signed_in?
      @books = current_user.books
    else
      @books = Book.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = current_user.books.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
      unless @book = current_user.books.where(id: params[:id]).first
        redirect_to books_path, alert: "You can only edit your own books."
      end
  end

  # POST /books
  # POST /books.json
  def create

    @book = current_user.books.new(params[:book])
    puts "////////////////////"
    puts params[:book]
    puts @book.inspect
    puts "////////////////////"

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update

    @book = current_user.books.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def mini_info
    @book = Book.find(params[:id])
    info = ''
    info << '<h4>' + @book.title + '</h4>'
    info << '<p>' + @book.author + '</p>'
    return info
  end
  
end
