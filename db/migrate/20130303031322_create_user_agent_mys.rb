class CreateUserAgentMys < ActiveRecord::Migration
  def change
    create_table :user_agent_mys do |t|
      t.string :browser_name
      t.string :browser_version
      t.string :device_model
      t.string :device_vendor
      t.string :device_type
      t.string :engine_name
      t.string :engine_version
      t.string :os_name
      t.string :os_version
      
      t.integer :height
      t.integer :width
      
      t.string :ua
      t.string :md5

      t.timestamps
    end
  end
end
