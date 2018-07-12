class IndexController < ApplicationController
  # Rails знает что IndexController#index это точка входа для /, и автоматом рендерит views/index/index.html.erb
protect_from_forgery with: :null_session
end
