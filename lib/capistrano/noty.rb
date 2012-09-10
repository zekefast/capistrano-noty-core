module Capistrano
  class Noty

    # Initialize Capistrano Noty infrastructure on default Capistrano's
    # configuration instance.
    #
    # @param [::Capistrano::Configuration] capistrano  instance to work with
    #
    # @return [::Capistrano::Noty] instance
    def self.load(capistrano)
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
    end
  end
end

Capistrano::Configuration.instance(:must_exist).load do
  Capistrano::Noty.load(self)
end
