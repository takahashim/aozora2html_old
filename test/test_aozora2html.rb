# encoding: utf-8
require 'test_helper'
require 'aozora2html'
require 'fileutils'
require 'tmpdir'

class Aozora2HtmlTest < Test::Unit::TestCase
  def setup
  end

  def test_aozora2html_new
    Dir.mktmpdir do |dir|
      input = File.join(dir,'dummy.txt')
      output = File.join(dir,'dummy2.txt')
      File.write(input, "テスト\r\n")
      parser = Aozora2Html.new(input, output)

      assert_equal Aozora2Html, parser.class
    end
  end

  def test_scount
    Dir.mktmpdir do |dir|
      input = File.join(dir,'dummy.txt')
      output = File.join(dir,'dummy2.txt')
      File.write(input, "a\r\nb\r\nc\r\n")
      parser = Aozora2Html.new(input, output)

      assert_equal 0, parser.scount
      ch = parser.read_char
      assert_equal "a",ch
      assert_equal 1, parser.scount
      ch = parser.read_char
      assert_equal "\r\n",ch
      assert_equal 1, parser.scount
      ch = parser.read_char
      assert_equal "b",ch
      assert_equal 2, parser.scount
      ch = parser.read_char
      assert_equal "\r\n",ch
      assert_equal 2, parser.scount
      ch = parser.read_char
      assert_equal "c",ch
      assert_equal 3, parser.scount
    end
  end

  def test_read_line
    Dir.mktmpdir do |dir|
      input = File.join(dir,'dummy.txt')
      output = File.join(dir,'dummy2.txt')
      File.write(input, "ab\r\nc\r\n")
      parser = Aozora2Html.new(input, output)

      parsed = parser.read_line
      assert_equal "ab", parsed
    end
  end

  def test_char_type
    Dir.mktmpdir do |dir|
      input = File.join(dir,'dummy.txt')
      output = File.join(dir,'dummy2.txt')
      File.write(input, "ab\r\nc\r\n")
      parser = Aozora2Html.new(input, output)

      assert_equal :kanji, parser.char_type(Embed_Gaiji_tag.new(nil,"foo","1-2-3","name"))
      assert_equal :kanji, parser.char_type(UnEmbed_Gaiji_tag.new(nil,"foo"))
      assert_equal :hankaku, parser.char_type(Accent_tag.new(nil,123,"abc"))
      assert_equal :else, parser.char_type(Okurigana_tag.new(nil,"abc"))
      assert_equal :else, parser.char_type(Inline_keigakomi_tag.new(nil,"abc"))
      assert_equal :katakana, parser.char_type(Dakuten_katakana_tag.new(nil,1,"abc"))

      assert_equal :hiragana, parser.char_type("あ".encode("shift_jis"))
      assert_equal :hiragana, parser.char_type("っ".encode("shift_jis"))
      assert_equal :katakana, parser.char_type("ヴ".encode("shift_jis"))
      assert_equal :katakana, parser.char_type("ー".encode("shift_jis"))
      assert_equal :zenkaku, parser.char_type("ｗ".encode("shift_jis"))
      assert_equal :hankaku, parser.char_type("z".encode("shift_jis"))
      assert_equal :kanji, parser.char_type("漢".encode("shift_jis"))
      assert_equal :hankaku_terminate, parser.char_type("!".encode("shift_jis"))
      assert_equal :else, parser.char_type("？".encode("shift_jis"))
    end
  end

  def teardown
  end
end
