Gem::Specification.new do |s|
  s.name = 'blockmason-link'
  s.version = '0.1.2'
  s.date = '2019-08-19'
  s.summary = 'Blockmason Link SDK'
  s.description = 'Interact with your Blockmason Link projects with ease.'
  s.authors = ['Devin Canterberry']
  s.email = 'devin@blockmason.io'
  s.files = [
    'lib/blockmason.rb',
    'lib/blockmason/link.rb',
    'lib/blockmason/link/connection.rb',
    'lib/blockmason/link/managed_session.rb',
    'lib/blockmason/link/project.rb',
    'lib/blockmason/link/provider.rb',
    'lib/blockmason/link/session.rb'
  ]
  s.homepage = 'https://blockmason.link'
  s.license = 'MIT'
  s.cert_chain = ['certs/canterberry.pem']
  s.signing_key = ENV['GEM_SIGNING_KEY_PATH'] if ENV.has_key?('GEM_SIGNING_KEY_PATH')
end
