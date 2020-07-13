ActiveAdmin.register_page 'Tests' do
  content do
    render text: "[engine] request.path : #{request.path}"
  end
end
