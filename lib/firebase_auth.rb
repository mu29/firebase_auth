require 'jwt'
require 'httparty'
require 'firebase_auth/id_token_verifier'
require 'firebase_auth/public_keys'

module FirebaseAuth
  class Auth
    include Singleton

    def initialize
      refresh
    end

    def public_keys
      resolve { @public_keys }
    end

    def verify_id_token(id_token)
      result = resolve { @id_token_verifier.verify(id_token) }

      if result
        OpenStruct.new(result.payload)
      end
    end

    class << self
      delegate :verify_id_token, :public_keys, to: :instance
    end

    private

    def refresh
      @public_keys = PublicKeys.new
      @id_token_verifier = IDTokenVerifier.new(@public_keys)
    end

    def resolve
      refresh unless @public_keys.valid?

      yield
    end
  end
end
