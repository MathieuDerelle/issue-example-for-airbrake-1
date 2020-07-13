class AppTestsController < ApplicationController
  def index
    render text: "[app] request.path : #{request.path}"
  end
end
