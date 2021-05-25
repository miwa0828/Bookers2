class AddBooksToOpinionn < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :opinion, :text, uniqueness: true
  end
end
