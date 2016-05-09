class Aozora2Html
  class Tag
    class MultilineYokogumi < Aozora2Html::Tag
      include Aozora2Html::Tag::Block
      include Aozora2Html::Tag::Multiline

      def initialize(parser)
        super
      end

      def to_s
        %Q|<div class="yokogumi">|
      end
    end
  end
end
