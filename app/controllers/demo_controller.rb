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
  end
  
  # uc = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HUAWEI C8812 Build/HuaweiC8812) UC AppleWebKit/534.31 (KHTML, like Gecko) Mobile Safari/534.31

  # an = Mozilla/5.0 (Linux; U; Android 4.0.3; zh-cn; HW-HUAWEI_C8812/C8812V100R001C92B913SP02; 480*800; CTC/2.0) AppleWebKit/534.30 Mobile Safari/534.30
end
