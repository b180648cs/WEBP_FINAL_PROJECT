json.extract! book, :id, :Book_ID, :Book_Title, :Author, :Publishers, :Year, :created_at, :updated_at
json.url book_url(book, format: :json)
