module Capistrano
  module Noty
    class Loader

      # @param [::Capistrano::Configuration] capistrano  instance to work with
      def initialize(capistrano)
        @capistrano = capistrano
      end

      # Register plugin in Capistrano
      #
      # @param [Symbol]                       name    Capistrano plugin name
      #                                               to register
      # @param [::Capistranote::Noty::Plugin] plugin  Capistrano plugin instance
      #
      # @return [::Capistrano::Noty::Loader] loader instance
      def load_plugin(name, plugin)
        Capistrano.plugin(name, plugin)

        self
      end

      # Load recipes into Capistrano's configuration instance.
      #
      # @param [String] path  path to dirctory which contains capistrano recipes.
      #                       Usually this is **/recipes/ directory inside your
      #                       Capistrano Noty extension.
      #
      # @return [::Capistrano::Noty::Loader] loader instance
      def load_recipes(path)
        @capistrano.load Dir[path + '/**/*.rb']

        self
      end
    end
  end
end
