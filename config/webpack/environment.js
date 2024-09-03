const { environment } = require('@rails/webpacker')

environment.plugins.append(
  'Environment',
  new webpack.EnvironmentPlugin({
    GOOGLE_MAPS_API_KEY: process.env.GOOGLE_MAPS_API_KEY
  })
)

module.exports = environment
