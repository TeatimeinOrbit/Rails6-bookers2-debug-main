class RemoveCommetFromBookComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_comments, :commet, :text
  end
end
