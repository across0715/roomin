ActiveAdmin.register_page "generate_user_pdf" do
  require "rqrcode"
  require "rqrcode_png"
  require "chunky_png"
  require "wicked_pdf"

  content do
    render partial: "index"
  end

  controller do
    def index
      @generate_staffs = Staff.where(display: true)
      @account = Account.new
    end

    def create
      # binding.pry

      # パスワード（ランダムな文字列）のリスト（配列）を作成。
      # 個数は入力画面で決定した個数とする
      # User.generate_password_list(個数)
      quantity = account_params[:user_quantity].to_i
      user_params_list = User.generate_list(quantity)
      # パスワードリストを利用して、必要な個数分ユーザーの新規アカウントを作成

      User.create!(user_params_list)

      @base_url = "http://localhost:3000/users/sign_in"
      @user_list = user_params_list.map do |params|
        password = params[:password]
        url = "#{@base_url}?password=#{password}"
        qr = qrcode_tag(url)
        { qr: qr, url: @base_url, password: password }
      end

      @account = Account.create!(account_params)

      render pdf: "users_#{Time.current.to_i}",
             encording: "UTF-8",
             layout: "application",
             margin: {
               top: 30,
               bottom: 30,
               left: 10,
               right: 10,
             }
      #  show_as_html: params[:show_as_html].present?
    end

    private

    def account_params
      params.require(:account).permit(:staff_id, :user_quantity)
    end

    def qrcode_tag(url, _options = {})
      qr = ::RQRCode::QRCode.new(url)
      ChunkyPNG::Image.from_datastream(qr.as_png.resize(250, 250).to_datastream).to_data_url
    end
  end
end

#   private

#   # def generate_user_pdf
#   #   params.require(:account).permit(:staff_id, :user_quantity)
#   # end

#   def product_params
#     params.require(:product).permit(:category, :name, :image, :avalable)
#   end
# end
