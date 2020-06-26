require_relative 'lib/firebase_auth/version'

Gem::Specification.new do |spec|
  spec.name          = 'firebase_auth'
  spec.version       = FirebaseAuth::VERSION
  spec.authors       = ['mu29']
  spec.email         = ['mu29@yeoubi.net']

  spec.summary       = 'Verify & decode Firebase ID token on Ruby'
  spec.homepage      = 'https://github.com/mu29/firebase_auth'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'jwt'
  spec.add_dependency 'httparty'
end
