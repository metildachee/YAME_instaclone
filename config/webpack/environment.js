const { environment } = require('@rails/webpacker')

<<<<<<< HEAD
=======
const { environment } = require('@rails/webpacker')

>>>>>>> d8568955d278a1393a24326544924fa35f2ee1d5
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

$: 'jquery',

jQuery: 'jquery',

Popper: ['popper.js', 'default']

}))

module.exports = environment
