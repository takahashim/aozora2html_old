require 'aozora2html/tag/reference_mentioned'

class Aozora2Html
  class Tag
    class InlineKeigakomi < ReferenceMentioned

      def initialize(parser, target)
        @target = target
        super
      end

      def to_s
        %Q|<span class="keigakomi">#{@target.to_s}</span>|
      end
    end
  end
end
