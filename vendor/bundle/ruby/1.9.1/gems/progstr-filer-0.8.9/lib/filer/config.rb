
module Progstr
  module Filer
    class << self
      attr_accessor :host, :port, :path_prefix, :session_timeout, :asset_url_prefix, :upload_url, :use_ssl
      attr_writer :access_key, :secret_key

      def access_key
        @access_key || ENV['PROGSTR_FILER_ACCESS_KEY']
      end

      def secret_key
        @secret_key || ENV['PROGSTR_FILER_SECRET_KEY']
      end

      def host
        @host ||= "filer-api.progstr.com"
      end

      def default_asset_url_prefix
        insecure_prefix = "http://cdn.progstr.com/upload/"
        secure_prefix = "https://s3.amazonaws.com/cdn.progstr.com/upload/"
        javascript_version = "1.0"

        prefix = insecure_prefix
        prefix = secure_prefix if use_ssl
        prefix + javascript_version
      end

      def default_upload_url
        "http://#{Progstr::Filer.host}/upload/new"
      end

      def port
        @port || 80
      end
      def path_prefix
        @path_prefix ||= '/'
      end
      def session_timeout
        @session_timeout ||= 30 * 60 # 30 minutes
      end

      def generate_auth_token
        expiration = expiration_time
        to_sign = "#{access_key}-#{expiration}-#{secret_key}"
        signature = Digest::SHA1.hexdigest(to_sign)
        "#{access_key}-#{expiration}-#{signature}"
      end

      def generate_download_auth_token(file_id)
        expiration = expiration_time
        to_sign = "#{access_key}-#{file_id}-#{expiration}-#{secret_key}"
        signature = Digest::SHA1.hexdigest(to_sign)
        "#{access_key}-#{expiration}-#{signature}"
      end

      def generate_upload_auth_token(uploader)
        expiration = expiration_time
        to_sign = "#{access_key}-#{uploader}-#{expiration}-#{secret_key}"
        signature = Digest::SHA1.hexdigest(to_sign)
        "#{access_key}-#{expiration}-#{signature}"
      end

      def url_prefix
        prefix = "http://#{Progstr::Filer.host}:#{Progstr::Filer.port}#{Progstr::Filer.path_prefix}"
        if prefix.end_with? "/"
          prefix
        else
          prefix + "/"
        end
      end

      private
      def expiration_time
        seconds = (Time.now + session_timeout).to_i
        millis = seconds * 1000
        millis
      end
    end
  end
end
