require 'aozora2html/tag/indent'

class Aozora2Html
  class Tag
    class Jisage < Aozora2Html::Tag::Indent

      def initialize(parser, width)
        @width = width
        super
      end

      def to_s
        %Q|<div class="jisage_#{@width}" style="margin-left: #{@width}em">|
      end
    end
  end
end
