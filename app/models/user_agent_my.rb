class UserAgentMy < ActiveRecord::Base
  self.table_name = "user_agent_mys"
  
  def to_s
    "#{os_name} #{os_version}, #{device_vendor} #{device_model}, #{browser_name} #{browser_version}, #{engine_name} "
  end
  
  def self.to_csv(options = {})
    s = CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ua|
        csv << ua.attributes.values_at(*column_names)
      end
    end
    #Iconv.conv 'GBK', 'UTF8', s
  end
end
