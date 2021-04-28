module ApplicationHelper
  def selectable_locale_list
    # [:en, :ja, :th, :"fr-FR", :"zh-CN"]
    [
      { value: :ja, name: "日本語" },
      { value: :en, name: "English" },
      { value: :"zh-CN", name: "汉语" },
      { value: :"fr-FR", name: " le français" },
      { value: :"th", name: "ภาษาไทย" },
    ]
  end
end
