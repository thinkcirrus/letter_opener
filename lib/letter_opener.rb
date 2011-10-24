require "fileutils"
require "digest/sha1"
require "cgi"
require "launchy"

require "letter_opener/message"
require "letter_opener/delivery_method"
require "letter_opener/engine" if defined? Rails

module LetterOpener
  def self.letters_location
    Rails.root.join("tmp", "letter_opener")
  end

  def self.cannot_write_to_file_system!
    require 'fakefs/safe'
    @cannot_write_to_file_system = true
  end
  def self.cannot_write_to_file_system?
    @cannot_write_to_file_system
  end

  def self.on_file_system
    if cannot_write_to_file_system?
      FakeFS { yield }
    else
      yield
    end
  end

end

