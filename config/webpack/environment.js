const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
 environment.plugins.prepend('Provide',
 new webpack.ProvidePlugin({
     $: 'jquery/src/jquery',
     jQuery: 'jquery/src/jquery'
  })
)
environment.config.merge({
    output: {
        hashFunction: "SHA224"
    }
 })

module.exports = environment
