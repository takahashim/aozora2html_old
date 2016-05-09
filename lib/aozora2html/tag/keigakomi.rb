class Aozora2Html
  class Tag
    class Keigakomi < Aozora2Html::Tag
      include Aozora2Html::Tag::Block
      include Aozora2Html::Tag::Multiline

      def initialize (parser, size = 1)
        @size = size
        super
      end

      def to_s
        %Q|<div class="keigakomi" style="border: solid #{@size}px">|
      end
    end
  end
end
