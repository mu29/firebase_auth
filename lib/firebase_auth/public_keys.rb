module FirebaseAuth
  class PublicKeys
    URL = 'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com'
    EXPIRES_HEADER = 'expires'

    attr_reader :response

    delegate :keys, :values, to: :data

    def initialize
      @response = fetch
    end

    def valid?
      Time.now.utc < time_to_expire
    end

    def data
      @parsed_body ||= JSON.parse(response.body)
    end

    def look_up(kid)
      @certificate_hash ||= Hash[data.map { |k, v| [k, OpenSSL::X509::Certificate.new(v)] }]
      @certificate_hash[kid]
    end

    private

    def time_to_expire
      @time_to_expire ||= Time.parse(
        response.headers[EXPIRES_HEADER]
      )
    end

    def fetch
      HTTParty.get(URL)
    end
  end
end
