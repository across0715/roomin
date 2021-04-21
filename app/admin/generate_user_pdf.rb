ActiveAdmin.register_page "generate_user_pdf" do
  require "rqrcode"
  require "rqrcode_png"
  require "chunky_png"
  content do
    render partial: "index"
  end

  controller do
    def index
      @generate_staffs = Staff.where(display: true)
    end

    def create
      # binding.pry

      # パスワード（ランダムな文字列）のリスト（配列）を作成。
      # 個数は入力画面で決定した個数とする
      # User.generate_password_list(個数)
      quantity = params[:user_quantity].to_i
      user_params_list = User.generate_list(quantity)
      # パスワードリストを利用して、必要な個数分ユーザーの新規アカウントを作成

      users = User.create!(user_params_list)

      base_url = "http://localhost:3000/users/sign_in"
      user_params_list.each do |user_param|
        url = "#{base_url}?password=#{user_param[:password]}"
      end

      # QRコードを作成

      # PDF を作成

      # Account を作成（誰が何個作成したか）

      # PDF を出力

      # @generate_user_pdfs = generated_password * @account.user_quantity

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
end
