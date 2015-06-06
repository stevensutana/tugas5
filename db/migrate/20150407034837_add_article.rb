class AddArticle < ActiveRecord::Migration
  def change
      create_table :postings do |t|
         t.string :title
         t.text :content
         t.timestamps
      end
  end
end
