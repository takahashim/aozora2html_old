class Aozora2Html
  class Tag
    class FontSize < Aozora2Html::Tag
      include Aozora2Html::Tag::Block
      include Aozora2Html::Tag::Multiline

      def initialize (parser, times, daisho)
        @class = daisho.to_s + times.to_s
        @style = case times
                 when 1
                   ""
                 when 2
                   "x-"
                 else
                   if times >= 3
                     "xx-"
                   else
                     raise Aozora_Error.new("文字サイズの指定が不正です")
                   end
                 end + case daisho
                       when :dai
                         "large"
                       when :sho
                         "small"
                       end
        super
      end

      def to_s
        %Q|<div class="#{@class}" style="font-size: #{@style};">|
      end
    end
  end
end
