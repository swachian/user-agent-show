class UserAgentMy < ActiveRecord::Base
  self.table_name = "user_agent_mys"
  
  def to_s
    "#{os_name} #{os_version}, #{device_vendor} #{device_model}, #{browser_name} #{browser_version}, #{engine_name} "
  end
end
