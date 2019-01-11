const merge = require('webpack-merge');
const common = require('./webpack.base.js');
const path = require('path')
const webpack = require('webpack')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
module.exports = merge(common, {
	devtool: 'inline-source-map',
	devServer: {
		contentBase: path.resolve(__dirname, '../dist'),
		inline:true,
		hot:true,
		historyApiFallback:true,
		quiet:true,
		host:'192.168.14.216'
	},
	plugins: [

	],
	mode:"development"
});