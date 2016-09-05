require 'API_Fuzzer/vulnerability'
require 'API_Fuzzer/error'
require 'API_Fuzzer/request'

module API_Fuzzer
  class CsrfCheck
    VALID_CSRF_PARAMS = ['csrf', 'token', 'authenticity_token', 'csrf_token'].map(&:downcase)
    VALID_CSRF_HEADERS = ['X-CSRF', 'CSRF-Token'].map(&:downcase)
    class << self
      def scan(options = {})
        @url = options[:url] || nil
        @params = options[:params] || {}
        @cookies = options[:cookies] || {}
        @json = options[:json] || false
        @vulnerabilities = []

        validate_csrf
      end

      def validate_csrf
        params = @params
        headers = request.headers
        matched_headers = headers.keys.select { |header| VALID_CSRF_HEADERS.any? { |exp| header.match(exp) } }
        matched_param = params.keys.select { |param| VALID_CSRF_PARAMS.any? { |exp| param.match(exp) } }

        
      end
    end
  end
end
