module Progstr
  module Filer
    class UploadStatus
      def initialize(parsed)
        @parsed = parsed
      end

      def name
        @parsed["name"]
      end
      def success
        @parsed["success"]
      end
      def message
        @parsed["message"]
      end
    end

    class Uploader
      def json_headers
        {
          :accept => "application/json",
          :"X-Progstr-Filer-Auth-Token" => Progstr::Filer.generate_auth_token,
        }
      end

      def upload_attachment(attachment)
        url = "#{Progstr::Filer.url_prefix}upload/new"
        begin
          response = RestClient.post(url, {
                      :upload1 => attachment.file,
                      :authToken => Progstr::Filer.generate_auth_token,
                      :uploader => self.class.name,
                      :id => attachment.id
                    }, json_headers)
          UploadStatus.new MultiJson.decode(response)
        rescue => e
          if e.respond_to?(:response) && !e.response.nil?
            raise ApiError.new(MultiJson.decode(e.response))
          else
            raise
          end
        end
      end

      def delete_attachment(attachment)
        raise ApiError.new("message" => "Deleting a blank attachment.") if attachment.blank?
        url = "#{Progstr::Filer.url_prefix}files/#{attachment.id}"
        begin
          response = RestClient.delete(url, json_headers)
          UploadStatus.new MultiJson.decode(response)
        rescue MultiJson::DecodeError => unknown_error
          raise ApiError.new("message" => "Unknown server error when requesting #{url}:\r\n#{unknown_error}")
        rescue => e
          raise ApiError.new(MultiJson.decode(e.response))
        end
      end

      def file_info(attachment)
        raise ApiError.new("message" => "Getting info for a blank attachment.") if attachment.blank?

        url = "#{Progstr::Filer.url_prefix}files/info/#{attachment.id}"
        begin
          response = RestClient.get(url, json_headers)
          FileInfo.new MultiJson.decode(response)
        rescue MultiJson::DecodeError => unknown_error
          raise ApiError.new("message" => "Unknown server error when requesting #{url}:\r\n#{unknown_error}")
        rescue => e
          raise ApiError.new(MultiJson.decode(e.response))
        end
      end
    end
  end
end
