require 'noty/errors'
require 'noty/core'
require 'noty/loader'
require 'noty/plugin'
require 'noty/extension'


module Capistrano
  # @example
  #   set :noty_namespace, :noty # Default to notify
  class Noty

    DEFAULT_NAMESPACE = :notify
    RECIPES_DIR       = 'recipes'
    EXTENTION_TYPES   = [:channel, :data_source, :template]

    # Capistranot Noty Core instance used by default
    #
    # @attribute [r] instance
    mattr_accessor :instance

    # Capistrano configuration instance to operate on
    #
    # @attribute [r] capistrano
    attr_reader :capistrano


    # Initialize Capistrano Noty infrastructure on default Capistrano's
    # configuration instance.
    #
    # @param [::Capistrano::Configuration] capistrano  instance to work with
    #
    # @return [::Capistrano::Noty] instance
    def self.load(capistrano)
      core        = Core.new(capistrano.noty_namespace || DEFAULT_NAMESPACE)
      core.loader = Loader.new(capistrano)
      core.plugin = Plugin.new(core)

      core.loader.load_plugin(core.namespace, core.plugin)
      core.loader.load_recepies(core.recipes_path)

      # GOTCHA:
      #   Capistrano configuration could be set after loading Capistrano::Noty,
      #   so we need to postpone settings evaluation untill the moment when
      #   extensions are called.
      #   -- zekefast 2012-09-06
      core.configuration = lambda { capistrano.noty }

      self.instance = core
    end

    # Register capistrano-noty extension on core instance which allows to add
    # new notification channels, provide different templates for each channel
    # and feed templates with various information about deployer, system, etc.
    #
    # @overload register_extension(extension)
    #   Register given extension on default core instance with default name.
    #
    #   @param [::Capistrano::Noty::Extension] extension
    # @overload register_extension(name, extension)
    #   @param [Symbol, String]                name
    #   @param [::Capistrano::Noty::Extension] extension
    # @overload register_extension(name, extension, instance)
    #   @param [Symbol, String]                name
    #   @param [::Capistrano::Noty::Extension] extension
    #   @param [::Capistrano::Noty::Core]      core
    # @overload register_extension(extension, instance)
    #   @param [::Capistrano::Noty::Extension] extension
    #   @param [::Capistrano::Noty::Core]      core
    #
    # @return [::Capistrano::Noty::Core] core instance which was used to
    #                                    register extension
    #
    # @example
    #
    #   ::Capistrano::Noty.register_extension(:mail, ::Capistrano::Noty::Channel::MyMail)
    def self.register_extension(name, extension, core = nil)
      core ||= self.instance

      core.register(name, extension)
    end
  end
end

Capistrano::Configuration.instance(:must_exist).load do
  Capistrano::Noty.load(self)
end
