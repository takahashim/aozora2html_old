class Aozora2Html
  class Tag

    class MultilineStyle < Aozora2Html::Tag
      include Aozora2Html::Tag::Block
      include Aozora2Html::Tag::Multiline

      def initialize (parser, style)
        @style = style
        super
      end

      def to_s
        %Q|<div class="#{@style}">|
      end
    end
  end
end
