const merge = require('webpack-merge');
// const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
const common = require('./webpack.base.js');
const webpack = require('webpack');
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
module.exports = merge(common, {
	plugins: [
	],
	mode:"production"
});