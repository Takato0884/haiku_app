class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :syoku, :string
    add_column :posts, :niku, :string
    add_column :posts, :kekku, :string

    remove_column :posts, :content, :string
  end
end
