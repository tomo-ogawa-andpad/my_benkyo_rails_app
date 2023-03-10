class CreateUsersSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :users_summaries do |t|

      t.timestamps
    end
  end
end
