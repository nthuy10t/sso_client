require 'omniauth-oauth2'

    class Sso < OmniAuth::Strategies::OAuth2
      option :name, "sso"

      option :client_options, {
        :site => ENV["PROVIDER_URL"],
        :authorize_url => "#{ENV["PROVIDER_URL"]}/auth/sso/authorize",
        :access_token_url => "#{ENV["PROVIDER_URL"]}/auth/sso/get_access_token"
      }

      uid { raw_info['id'] } 

      info do
        {
          :email => raw_info["info"]['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/auth/sso/get_info_user.json?oauth_token=#{access_token.token}").parsed
      end
    end