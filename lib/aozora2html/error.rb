# encoding:utf-8

require 'aozora2html/exception'

class Aozora2Html
  class Error < Aozora2Html::Exception
    def message (line)
      "エラー(#{line}行目):".encode("shift_jis") + @message + ". \r\n処理を停止します".encode("shift_jis")
    end
  end
end

