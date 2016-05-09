require 'aozora2html/tag/jisage'

class Aozora2Html
  class Tag
    class OnlineJisage < Aozora2Html::Tag::Jisage
      include Aozora2Html::Tag::OnelineIndent
    end
  end
end
