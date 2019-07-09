# frozen_string_literal: true

module Nigilist
  def method_missing(message, *args, &block)
    method_name = message.to_s

    return false if method_name.end_with?('?')

    if method_name.end_with?('s') && method_name[-2..-1] != 'ss'
      if defined?(Rails)
        ar_relation_klass = method_name.singularize.camelize.safe_constantize
        return ar_relation_klass.none if ar_relation_klass && ar_relation_klass.respond_to?(:none)
      end

      return []
    end

    return nil unless method_name.end_with?('!')

    super
  end

  def respond_to_missing?(message, include_private = false)
    method_name = message.to_s

    method_name.end_with?('?') ||
    (method_name.end_with?('s') && method_name[-2..-1] != 'ss') ||
    !method_name.end_with?('!') ||
      super
  end
end
