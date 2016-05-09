# encoding: utf-8
require 'test_helper'
require 'aozora2html'

class ExceptionTest < Test::Unit::TestCase
  def test_raise_aozora_exception
    assert_raises(Aozora2Html::Exception) do
      raise Aozora2Html::Exception, "error!"
    end
  end

  def test_raise_aozora_error
    error_msg = ""
    begin
      raise Aozora2Html::Error, "sample error"
    rescue Aozora2Html::Error => msg
      error_msg = msg.message(123)
    end
    assert_equal "エラー(123行目):sample error. \r\n処理を停止します",
                 error_msg.encode("utf-8")

  end
end
