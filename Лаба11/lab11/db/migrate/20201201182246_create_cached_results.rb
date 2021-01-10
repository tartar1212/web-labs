class CreateCachedResults < ActiveRecord::Migration[6.0]
  def change
    create_table :cached_results do |t|
      t.string :input
      t.string :result

      t.timestamps
    end
    add_index :cached_results, :input, unique: true
  end
end
