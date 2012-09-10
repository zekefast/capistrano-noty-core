module Capistrano
  module Noty
    class Core
      # Capistrano namespace for tasks and plugins.
      #
      # @attribute [r] namespace
      attr_reader   :namespace
      # @attribute loader
      attr_accessor :loader
      # @attribute plugin
      attr_accessor :plugin

      # @attribute [w] configuration
      attr_writer   :configuration

      # @attribute channels
      attr_reader   :channels
      # @attribute data_sources
      attr_reader   :data_sources
      # @attribute templates
      attr_reader   :templates


      # @param [optional, String, Symbol] namespace  capistrano namespace to
      #   operate in. Default to (see ::Capistrano::Noty::DEFAULT_NAMESPACE).
      def initialize(namespace = Noty::DEFAULT_NAMESPACE)
        @namespace = namespace.to_sym

        @configuration= {}
        @channels     = {}
        @data_sources = {}
        @templates    = {}
      end

      # Evaluate lazy configuration if any and return it.
      #
      # @return [Hash] configuration of capistrano noty
      def configuration
        @configuration = @configuration.call if @configuration.instance_of?(Proc)
        @configuration
      end

      #
      #
      # @return [Array<::Capistrano::Noty::Extension>] list of all registered
      #   extensions
      def extensions
        [@channels, @data_sources, @templates].inject([]) do |result, exts|
          result << exts.values
        end
      end

      # Path to Capistrano Noty Core recipes.
      #
      # @return [String] path
      def recipes_path
        File.expand_path("./#{Noty::RECIPES_DIR}/", File.dirname(__FILE__))
      end

      # Register extension in the core.
      #
      # @param [Symbol] type
      # @param [Symbol] name
      # @param [::Capistrano::Noty::Extension] extension
      #
      # @return []
      def register(name extension)
        raise InvalidExtensionType.cannt_register(name, type) unless Noty::EXTENTION_TYPES.include? type

        # TODO: register dependencies on capistrano
        # TODO: instantiate objects
        # TODO: add to collection
      end
    end
  end
end
