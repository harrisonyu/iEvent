Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '177857492354813', '5988fd9fd26f439421c7b44fd8d3d72b'
end