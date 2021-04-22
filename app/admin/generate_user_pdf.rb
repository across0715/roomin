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

      users = User.create!(user_params_list)

      base_url = "http://localhost:3000/users/sign_in"

      # あとで作成した全てのユーザーのpdfにする
      # user_params_list.each do |user_param|
      # end

      @url = "#{base_url}?password=#{user_params_list[0][:password]}"
      # qr = qrcode_tag(url)
      # pdf = WickedPdf.new.pdf_from_url(qr)

      @account = Account.create!(account_params)
      @new_qr = qrcode_tag(@url)

      render pdf: "users_#{Time.current.to_i}",
             encording: "UTF-8",
             layout: "application"
      #  show_as_html: params[:show_as_html].present?
    end

    # QRコードを作成

    # PDF を作成 # PDF を出力

    # Account を作成（誰が何個作成したか）

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
