class DemoController < ApplicationController
  def view
    @ua = request.headers['User-Agent']
    @height = cookies['height']
    @width = cookies['width']
  end
end
