require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class JAccount < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.sjtu.edu.cn/v1',
        :authorize_url => 'https://jaccount.sjtu.edu.cn/oauth2/authorize',
        :token_url => 'https://jaccount.sjtu.edu.cn/oauth2/token'
      }

      option :authorize_params, {scope: "essential"}

      def request_phase
        super
      end

      uid { raw_info["id"].to_s }

      info do
        {
          'email' => raw_info['account'] + "@sjtu.edu.cn",
          'name' => raw_info['name']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('https://api.sjtu.edu.cn/v1/me/profile').parsed
        #puts @raw_info
        @raw_info["entities"][0]
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'jaccount', 'JAccount'
