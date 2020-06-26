module FirebaseAuth
  class IDTokenVerifier
    JWT_OPTIONS = { algorithm: 'RS256', verify_iat: true }

    def initialize(public_keys)
      @public_keys = public_keys
    end

    def verify(id_token)
      kid = JWT.decode(id_token, nil, false).last['kid'] rescue nil
      decode_jwt(id_token, @public_keys.look_up(kid))
    end

    private

    def decode_jwt(id_token, x509)
      JWT.decode(id_token, x509.public_key, true, JWT_OPTIONS) rescue nil
    end
  end
end
