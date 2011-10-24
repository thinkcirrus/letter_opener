module LetterOpener
  class Engine < Rails::Engine
    initializer "letter_opener.add_delivery_method" do
      ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, :location => LetterOpener.letters_location
    end
  end

  def self.letters_location
    Rails.root.join("tmp", "letter_opener")
  end

  def self.cannot_write_to_file_system!
    require 'fakefs/safe'
    @cannot_write_to_file_system = true
  end


  def self.on_file_system
    if @cannot_write_to_file_system
      FakeFS { yield }
    else
      yield
    end
  end

end

