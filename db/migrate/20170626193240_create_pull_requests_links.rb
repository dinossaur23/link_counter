class CreatePullRequestsLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :pull_requests_links do |t|
      t.string :link, unique: true
      t.integer :count, default: 0

      t.timestamps
    end
    add_index :pull_requests_links, :link, unique: true
  end
end
