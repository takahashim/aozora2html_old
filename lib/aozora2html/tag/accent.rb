class Aozora2Html
  class Tag
    class Accent < Aozora2Html::Tag
      include Aozora2Html::Tag::Inline

      def initialize (parser, code, name)
        @code = code
        @name = name
        super
      end

      def to_s
        marker = '※'.encode("shift_jis")
        %Q|<img src="#{$gaiji_dir}#{@code}.png" alt="#{marker}(#{@name})" class="gaiji" />|
      end
    end
  end
end
