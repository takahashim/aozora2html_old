require 'aozora2html/tag/chitsuki'

class Aozora2Html
  class Tag
    class OnelineChitsuki < Aozora2Html::Tag::Chitsuki
      include Aozora2Html::Tag::OnelineIndent
    end
  end
end
