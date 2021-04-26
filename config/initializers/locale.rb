I18n.load_path += Dir[Rails.root.join("lib", "locale", "*.{rb,yml}")]
I18n.config.available_locales = [:en, :ja, :zh]
I18n.default_locale = :ja
