require 'aozora2html/tag/gaiji'

class Aozora2Html
  class Tag
    class EmbedGaiji < Aozora2Html::Tag::Gaiji
      attr_accessor :unicode

      def self.use_jisx0213=(val)
        @use_jisx0213 = val
      end

      def self.use_jisx0213
        @use_jisx0213
      end

      def self.use_unicode=(val)
        @use_unicode = val
      end

      def self.use_unicode
        @use_unicode
      end

      def initialize (parser, folder, code, name)
        @folder = folder
        @code = code
        @name = name
        super
      end

      def jisx0213_to_unicode(code)
        Aozora2Html::JIS2UCS[code]
      end

      def to_s
        if EmbedGaiji.use_jisx0213 && @code
          jisx0213_to_unicode(@code.to_sym)
        elsif EmbedGaiji.use_unicode && @unicode
          '&#x'+@unicode+';'
        else
          %Q|<img src="#{$gaiji_dir}#{@folder}/#{@code}.png"| + ' alt="※('.encode("shift_jis") + @name + ')" class="gaiji" />'
        end
      end
    end
  end
end
