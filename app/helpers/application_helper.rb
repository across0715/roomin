module ApplicationHelper
  def selectable_locale_list
    # [:en, :ja, :th, :"fr-FR", :"zh-CN"]
    [
      { value: :ja, name: "日本語" },
      { value: :en, name: "English" },
      { value: :"zh-CN", name: "汉语" },
      { value: :"fr-FR", name: " le français" },
      { value: :th, name: "ภาษาไทย" },
    ]
  end

  def format_locale_name(product)
    case I18n.locale
    when :en
      product.name
    when :ja
      product.name_ja
    when :"zh-CN"
      product.name_zh_CN
    when :"fr-FR"
      product.name_fr_FR
    when :th
      product.name_th
    end
  end
end
