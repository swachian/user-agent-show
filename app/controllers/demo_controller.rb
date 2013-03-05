class DemoController < ApplicationController
  source = open("lib/ua-parser.js").read   
  @@js = ExecJS.compile(source)  
  @@js.eval 'parser = new UAParser()'  
  def view

    js_ua_parse()
    ua_parse_ruby()
    @height = cookies['height'] || 1
    @width = cookies['width'] || 1
    
    md5 = Digest::MD5.hexdigest(@ua)
    @uamy = UserAgentMy.find_by_md5(md5) || UserAgentMy.new
    @uamy.update_attributes(:ua => @ua, :browser_name => @browser['name'], :browser_version => @browser['version'],
    :device_model => @device['model'], :device_vendor => @device['vendor'], :device_type => @device['type'],
    :engine_name => @engine['name'], :engine_version => @engine['version'],
    :os_name => @os['name'], :os_version => @os['version'], :md5 => md5,
    :height => @height, :width => @width
    
    )
    
  end
  
  def list
    view
    @uas = UserAgentMy.all(:order => "os_name asc, os_version desc, device_vendor asc, browser_name asc, browser_version asc")
  end

  
  private
    
    def ua_params
      
    end
    
    def ua_parse_ruby
      @ua = request.headers['User-Agent']
      user_agent = UserAgentParser.parse @ua 
      @browser = {"name" => user_agent.name, "version" => user_agent.version.to_s}
      @device = {"model" => user_agent.device.name } if @device['model'].blank?
      #@os = {name: user_agent.os.name, version: user_agent.os.version}
    end
    
    def js_ua_parse
      @ua = request.headers['User-Agent']
      puts @ua
      @@js.eval "parser.setUA('#{@ua}')"
      @browser = @@js.eval 'parser.getBrowser()'
      @device = @@js.eval 'parser.getDevice()'
      @engine = @@js.eval 'parser.getEngine()'
      @os = @@js.eval 'parser.getOS()'
    end
  # uc = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HUAWEI C8812 Build/HuaweiC8812) UC AppleWebKit/534.31 (KHTML, like Gecko) Mobile Safari/534.31

  # an = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HW-HUAWEI_C8812/C8812V100R001C92B913SP02; 480*800; CTC/2.0) AppleWebKit/534.30 Mobile Safari/534.30
end
