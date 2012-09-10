module Capistrano
  module Noty
    #
    class InvalidExtensionType < StandardError
      # @param [String, Symbol] name  extension's name
      # @param [Symbol]         type  invalid extension's type
      #
      # @return [::Capistrano::Noty::InvalidExtensionType] exception
      def self.cannt_register(name, type)
        new("Can not register extention with unknown Capistrano Noty extention type: `#{type}`.")
      end
    end
  end
end
