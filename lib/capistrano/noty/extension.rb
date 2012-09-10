module Capistrano
  module Noty
    #
    # @abstract
    class Extension
      DEFAULT_EXTENSION_NAME_CONST = :DEFAULT_NAME


      module DependencyDeclarationDSL
        attr_writer :dependencies
        private :dependencies=
        @dependencies = []

        def depend(*args)
          @dependencies << args
        end
        private :depend

        # @return [] list of collected dependencies
        def dependencies
          # GOTCHA:
          #   nobody should be able to add dependecies to extension from outside
          #   -- zekefast 2012-09-06
          @dependencies.dup.freeze
        end
      end

      extend DependencyDeclarationDSL


      # @param [Symbol]
      def self.const_missing(name)
        return super unless name == DEFAULT_EXTENSION_NAME_CONST

        self.const_get(DEFAULT_EXTENSION_NAME_CONST) || self.extension_default_name(self)
      end

      # @param [Class] klass
      def self.extension_default_name(klass)
        # TODO:
      end

      # @param [Proc] lazy_configuration
      def initialize(lazy_configuration)
        @configuration = lazy_configuration
      end

    end
  end
end
