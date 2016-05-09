class Aozora2Html
  class Tag

    # 前方参照でこいつだけは中身をチェックする
    # 子要素を持つInline_tagは全てこいつのサブクラス
    class ReferenceMentioned < Aozora2Html::Tag  ## Abstract Class
      include Aozora2Html::Tag::Inline

      attr_accessor :target

      ## called from super()
      def initialize(*args)
        if block_element?(@target)
          syntax_error
        end
      end

      def block_element?(elt)
        if elt.is_a?(Array)
          elt.each{|x|
            return true if block_element?(x)
          }
          nil
        elsif elt.is_a?(String)
          elt.match(/<div/)
        else
          elt.is_a?(Aozora2Html::Tag::Block)
        end
      end

      def target_string
        if @target.is_a?(ReferenceMentioned)
          @target.target_string
        elsif @target.is_a?(Array)
          @target.collect{|x|
            if x.is_a?(ReferenceMentioned)
              x.target_string
            else
              x
            end}.to_s
        else
          @target
        end
      end
    end
  end
end
