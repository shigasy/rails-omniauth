class ApplicationController < ActionController::API
  # ログインユーザーによってのみ実行可能
  before_action :authenticate_api_v1_user! # 追記 (userの部分はmodel名)
end
