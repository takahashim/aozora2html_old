require 'aozora2html/tag/reference_mentioned'

class Aozora2Html
  class Tag
    class Dir < ReferenceMentioned

      def initialize(parser, target)
        @target = target
        super
      end

      def to_s
        %Q|<span dir="ltr">#{@target.to_s}</span>|
      end
    end
  end
end
