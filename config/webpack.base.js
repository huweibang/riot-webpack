const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const webpack = require('webpack')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const devMode = process.env.NODE_ENV !== "production"
module.exports = {
	entry: ['./src/index.js',"@babel/polyfill"],
	output: {
		filename: '[name].bundle.js',
		path: path.resolve(__dirname, '../dist'),
		publicPath:'/'
	},
	module: {
		rules: [
		{
			test: /\.css$/,
			use: [
			devMode ? 'style-loader' : MiniCssExtractPlugin.loader,
			'css-loader',
			{
				loader: 'postcss-loader',
				options:{
					config:{
						path:path.resolve(__dirname, '../postcss.config.js')
					}
				}
			}
			]
		},
		{
			test: /\.tag$/,
			exclude: /node_modules/,
			use: [{
				loader: 'riot-tag-loader',
				options: {
					hot: true,
				}
			}]
		},
		{ test: /\.js$/,
			exclude: /node_modules/,
			loader: 'babel-loader',
			options: {
				presets: ['@babel/preset-env']
			}
		},
		{
			test: /public[\\\/]/,
			use: [
			{
				loader: 'file-loader',
				options: {
					name:'public/[name].[ext]',
				}
			}
			]
		},
		
		{
			test: /\.(png|svg|jpg|gif)$/,
			use: [
			{
				loader: 'url-loader',
				options: {
					limit: 8192,
					name:'images/[hash].[ext]',
				}
			}
			]
		},
		{
			test: /\.(html)$/,
			use: {
				loader: 'html-loader',
				options: {
					attrs: [':data-src']
				}
			}
		},
		{
			test: /\.(woff|woff2|eot|ttf|otf|properties)$/,
			use: {
				loader:'file-loader',
				options:{
					name:'assets/[name].[ext]',
				}
			}
		},
		{
			test: /\.(csv|tsv)$/,
			use: [
			'csv-loader'
			]
		},
		{
			test: /\.xml$/,
			use: [
			'xml-loader'
			]
		}
		]
	},
	watchOptions: {
		aggregateTimeout: 300,
		poll: 1000
	},
	plugins: [
	new CleanWebpackPlugin(['dist'], {
		root: path.resolve(__dirname, '../'),
		verbose: true, 
		dry: false
	}),
	new HtmlWebpackPlugin({
		template:'./index.html',
		favicon:'favicon.png',

	}),
	new MiniCssExtractPlugin({
      // Options similar to the same options in webpackOptions.output
      // both options are optional
      filename: '[name].[hash].css',
      chunkFilename:'[id].[hash].css'
  }),
	new webpack.ProvidePlugin({
		riot: 'riot',
		$:'jquery',
		jQuery:'jquery'
	}),
	new webpack.NamedModulesPlugin(),
	new webpack.HotModuleReplacementPlugin(),
	new webpack.DefinePlugin({
		'process.env': {
			'NODE_ENV': JSON.stringify(process.env.NODE_ENV)
		}
	})
	]
};