require 'aozora2html/tag/kunten'

class Aozora2Html
  class Tag
    class Kaeriten < Aozora2Html::Tag::Kunten

      def initialize(parser, string)
        @string = string
        super
      end

      def to_s
        %Q|<sub class="kaeriten">#{@string.to_s}</sub>|
      end
    end
  end
end

