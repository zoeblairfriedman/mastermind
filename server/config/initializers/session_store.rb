if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_mastermind', domain: 'mastermind-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_mastermind'
end