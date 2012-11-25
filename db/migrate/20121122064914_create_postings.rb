class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :name
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
