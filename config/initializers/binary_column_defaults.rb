# Fix for possible ActiveRecord bug!
# https://rails.lighthouseapp.com/projects/8994/tickets/149-column-default-value

module ActiveRecord
  module ConnectionAdapters
    class MysqlColumn < Column #:nodoc:
      def extract_default(default)
        if type == :binary || type == :text
          if default.blank?
            return null ? nil : ''
          else
            #raise ArgumentError, "#{type} columns cannot have a default value: #{default.inspect}"
            super
          end
        elsif missing_default_forged_as_empty_string?(default)
          nil
        else
          super
        end
      end
    end
  end
end