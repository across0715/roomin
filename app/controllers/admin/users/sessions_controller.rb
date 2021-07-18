class Admin::Users::SessionsController < Devise::SessionsController
  # skip_before_action :authenticate_user!

  def guest_sign_in
    # ゲストアカウントでログイン
    sign_in AdminUser.guest
    # トップページへリダイレクト
    redirect_to admin_root_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
