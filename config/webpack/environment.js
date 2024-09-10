const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append(
  'Environment',
  new webpack.EnvironmentPlugin({
    GOOGLE_MAPS_API_KEY: process.env.GOOGLE_MAPS_API_KEY
  })
)

module.exports = environment
