class EngineTestsController < ActionController::Base
  def index
    render text: "[engine] request.path : #{request.path}"
  end
end
