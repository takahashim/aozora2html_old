class Aozora2Html
  class Tag
    class DakutenKatakana < Aozora2Html::Tag
      include Aozora2Html::Tag::Inline

      def initialize (parser, n, katakana)
        @n = n
        @katakana = katakana
        super
      end

      def to_s
        %Q|<img src="#{$gaiji_dir}/1-07/1-07-8#{@n}.png"| + ' alt="※(濁点付き片仮名「'.encode("shift_jis") + @katakana + %Q|」、1-07-8#{@n})" class="gaiji" />|.encode("shift_jis")
      end
    end
  end
end
