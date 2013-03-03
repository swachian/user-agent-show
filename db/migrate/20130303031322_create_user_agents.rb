class CreateUserAgents < ActiveRecord::Migration
  def change
    create_table :user_agents do |t|
      t.string :browser
      t.string :version
      t.string :os
      t.string :mobile
      t.string :model
      t.string :vendor
      t.string :md5

      t.timestamps
    end
  end
end
