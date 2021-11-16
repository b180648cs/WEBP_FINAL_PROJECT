class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
  end
  def home
    @books = Book.all
    render json: @books
  end

  def book
    @book = Book.find(params[:id])
    render json: @book
  end
  # GET /books/1 or /books/1.json
  def show
  end

  def newBook
    @book = Book.new(book_params)
    if @book.save
      render json: { book: @book, status: 'success' }
    else
      render json: { book: @book.errors, status: 'fail' }
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    book = Book.find(params[:id])
                if book.update(book_params)
                    render json: {status: 'SUCCESS', message:'Updated book', data:book},status: :ok
                else
                    render json: {status: 'ERROR', message:'book not updated', data:book.errors},status: :unprocessable_entity
                end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: {status: 'SUCCESS', message:'Deleted book', data:book},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:Book_ID, :Book_Title, :Author, :Publishers, :Year)
    end
end
