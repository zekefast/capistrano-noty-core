module Capistrano
  module Noty

    # Capistrano plugin.
    # It could be used in your config/deploy.rb to call notification.
    #
    # @example
    #   # somewhere in you config/deploy.rb
    #   # Actual format is <noty_namespace>.<channel_name>,
    #   # by default notify namespace is used and we call email notification
    #   # in this example.
    #
    #   after 'deploy'
    #     notify.mail
    #   end
    class Plugin

      # @param [::Capistrano::Noty::Core] core
      def initialize(core)
        @core = core
      end

      # Trigger notification to channel.
      #
      # @param [Symbol] channel
      # @param [Array]  args
      def method_missing(channel, *args)
        return super unless core.channels.include?(channel)

        core.channels[channel].
      end

    end
  end
end
