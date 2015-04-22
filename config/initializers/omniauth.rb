Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '8b974de0204d8fce5870', 'ee476965561b46b8f2ee27760bf22a82cf8df1fc'
end
