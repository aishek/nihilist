module Nigilist
  def method_missing(message, *args, &block)
    method_name = message.to_s
    if method_name.end_with?('?')
      false
    elsif !method_name.end_with?('!')
      nil
    else
      super
    end
  end
end
