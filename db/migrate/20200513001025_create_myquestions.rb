class CreateMyquestions < ActiveRecord::Migration[5.2]
  def change
    create_table :myquestions do |t|
      t.text :content
      t.timestamps
    end
  end
end
