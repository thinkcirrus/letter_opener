module LetterOpener
  class Letter
    attr_accessor :name, :updated_at

    def initialize(attributes)
      @name = attributes[:name]
      @updated_at = attributes[:updated_at]
    end

    def self.all
      LetterOpener.on_file_system do
        letters = Dir.glob("#{LetterOpener.letters_location}/*").map do |folder|
          new :name => File.basename(folder), :updated_at => File.mtime(folder)
        end
        letters.sort_by(&:updated_at).reverse
      end
    end

    def self.find_by_name(name)
      new(:name => name)
    end

    def filepath(style = :plain)
      "#{LetterOpener.letters_location}/#{name}/#{style}.html"
    end

    def contents(style = :plain)
      LetterOpener.on_file_system do
        File.read(filepath(style))
      end
    end
  end
end
