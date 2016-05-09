require 'aozora2html/tag/reference_mentioned'

class Aozora2Html
  class Tag
    class InlineFontSize < ReferenceMentioned

      def initialize(parser, target, times, daisho)
        @target = target
        @klass = daisho.to_s + times.to_s
        case times
        when 1
          @style = ""
        when 2
          @style = "x-"
        else
          if times >= 3
            @style = "xx-"
          else
            raise Aozora2Html::Error, "文字サイズの指定が不正です"
          end
        end
        case daisho
        when :dai
          @style += "large"
        when :sho
          @style += "small"
        end
        super
      end

      def to_s
        %Q|<span class="#{@klass}" style="font-size: #{@style};">#{@target.to_s}</span>|
      end
    end
  end
end
