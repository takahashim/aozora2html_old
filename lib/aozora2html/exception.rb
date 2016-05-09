# Exception class
class Aozora2Html
  class Exception < ::Exception
    def initialize(message)
      @message = message
    end
  end
end

