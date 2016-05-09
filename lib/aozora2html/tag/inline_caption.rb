require 'aozora2html/tag/reference_mentioned'

class Aozora2Html
  class Tag
    class InlineCaption < ReferenceMentioned
      def initialize(parser, target)
        @target = target
        super
      end

      def to_s
        %Q|<span class="caption">#{@target.to_s}</span>|
      end
    end
  end
end
