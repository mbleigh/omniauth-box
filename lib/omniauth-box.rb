require "omniauth-box/version"
require 'box-api'
require 'omniauth'

module OmniAuth
  module Strategies
    class Box
      include OmniAuth::Strategy

      args [:api_token]

      option :api_token, nil
      option :name, 'box'

      attr_accessor :auth_token

      def account
        ::Box::Account.new(options[:api_token])
      end

      def client
        client = ::Box::Api.new(options[:api_token])
        client.set_auth_token(self.auth_token)
        client
      end

      def request_phase
        account.authorize do |authorize_url|
          return redirect authorize_url
        end
      end

      def callback_phase
        self.auth_token = request.params["auth_token"]
        super
      end

      uid{ raw_info['user']['user_id'] }

      info do
        {
          :email => raw_info['user']['email'],
          :nickname => raw_info['user']['login'],
        }
      end

      extra{ {:raw_info => raw_info} }
      credentials{ {:token => self.auth_token} }

      def raw_info
        @raw_info ||= client.get_account_info
      end
    end
  end
end