module ApplicationHelper
  def selectable_locale_list
    # [:ko, :en, :ja, :th, :"fr-FR", :"zh-CN"]
    [
      { value: :ko, name: "한국어" },
      { value: :ja, name: "日本語" },
      { value: :en, name: "English" },
      { value: :"zh_CN", name: "汉语" },
      { value: :"fr_FR", name: " le français" },
      { value: :th, name: "ภาษาไทย" },
    ]
  end

  # def product.name
  #   case I18n.locale
  #   when :en
  #     product.name_en
  #   when :ja
  #     product.name_ja
  #   when :"zh-CN"
  #     product.name_zh_CN
  #   when :"fr-FR"
  #     product.name_fr_FR
  #   when :th
  #     product.name_th
  #   end
  # end
end
