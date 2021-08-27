class CreateEmojis < ActiveRecord::Migration[6.0]
  def change
    create_table :emojis do |t|
      t.text :body

      t.timestamps
    end
  end
end
