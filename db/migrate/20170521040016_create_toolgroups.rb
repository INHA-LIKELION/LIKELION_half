class CreateToolgroups < ActiveRecord::Migration[5.0]
  def change
    create_table :toolgroups do |t|
      t.string :title
      t.string :content
      t.string :img_url
      t.belongs_to :user

      t.timestamps
    end
  end
end
