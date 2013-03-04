class DemoController < ApplicationController
  source = open("lib/ua-parser.js").read   
  @@js = ExecJS.compile(source)  
  @@js.eval 'parser = new UAParser()'  
  def view
    @ua = request.headers['User-Agent']
    puts @ua
    @@js.eval "parser.setUA('#{@ua}')"
    @browser = @@js.eval 'parser.getBrowser()'
    @device = @@js.eval 'parser.getDevice()'
    @engine = @@js.eval 'parser.getEngine()'
    @os = @@js.eval 'parser.getOS()'
    
    
    @height = cookies['height']
    @width = cookies['width']
    
    md5 = Digest::MD5.hexdigest(@ua)
    @uamy = UserAgentMy.find_by_md5(md5) || UserAgentMy.new
    @uamy.update_attributes(:ua => @ua, :browser_name => @browser['name'], :browser_version => @browser['version'],
    :device_model => @device['model'], :device_vendor => @device['vendor'], :device_type => @device['type'],
    :engine_name => @engine['name'], :engine_version => @engine['version'],
    :os_name => @os['name'], :os_version => @os['version'], :md5 => md5
    
    )
    
  end

  
  private
    
    def ua_params
      
    end
  # uc = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HUAWEI C8812 Build/HuaweiC8812) UC AppleWebKit/534.31 (KHTML, like Gecko) Mobile Safari/534.31

  # an = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HW-HUAWEI_C8812/C8812V100R001C92B913SP02; 480*800; CTC/2.0) AppleWebKit/534.30 Mobile Safari/534.30
end
