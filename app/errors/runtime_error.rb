class BaseError < RuntimeError
  def initialize(code, message)
    @code = code
    @message = message
  end

  def rack
    [
      @code,
      @message.to_json,
    ]
  end
end
