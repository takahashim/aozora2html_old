require 'aozora2html/tag/reference_mentioned'

class Aozora2Html
  class Tag
    class Midashi < ReferenceMentioned
      MidashiClass = {normal: {
                        "h5" => "ko-midashi",
                        "h4" => "naka-midashi",
                        "h3" => "o-midashi"},
                      dogyo: {
                        "h5" => "dogyo-ko-midashi",
                        "h4" => "dogyo-naka-midashi",
                        "h3" => "dogyo-o-midashi"},
                      mado: {
                        "h5" => "mado-ko-midashi",
                        "h4" => "mado-naka-midashi",
                        "h3" => "mado-o-midashi"},
                     }

      def initialize(parser, target, size, type)
        super
        @target = target
        if size.match("小")
          @id = parser.new_midashi_id(1)
          @tag = "h5"
        elsif size.match("中")
          @id = parser.new_midashi_id(10)
          @tag = "h4"
        elsif size.match("大")
          @id = parser.new_midashi_id(100)
          @tag = "h3"
        else
          raise Aozora2Html::Error, "未定義な見出しです"
        end

        if MidashiClass[type] && MidashiClass[type][@tag]
          @klass = MidashiClass[type][@tag]
        else
          raise Aozora2Html::Error, "未定義な見出しです"
        end
      end

      def to_s
        %Q|<#{@tag} class="#{@klass}"><a class="midashi_anchor" id="midashi#{@id}">#{@target}</a></#{@tag}>|
      end
    end
  end
end
