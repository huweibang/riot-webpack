           var  Ethereum = require('./contractsHelper.js')
           var Promise = require('bluebird')
           var _ = require('lodash')

        /**
         * JUST.js, propietary dapp framework.
         * NSA level protection on the dreaded ctrl c + ctrl v key combo
         * We are watching you. 
         * Always
         */

         const Interface = {
            UI: new (function () { riot.observable(this);this.language = '' })(),
            Bridges: [],
            Cache: {},
            TimeDifference: false,
            /*
             * params.providers is the array containing all our possible API providers for interaction with the ETH blockchain.
             * params.contracts is the array containing all of the contracts we need to interact with.
             */
             connect: async (params) => {
                try {
                    await Promise.map(params.providers, async instance => {
                        if (instance.API) {
                            Interface.Bridges[instance.name] = new Ethereum.Bridge({
                                web3: instance.API
                            })
                            await Promise.map(params.contracts, async contract => {

                                Interface.Bridges[instance.name].contracts[contract.name] =
                                new contract.model({
                                    address: contract.address,
                                    ABI: contract.ABI,
                                    bridge: Interface.Bridges[instance.name]
                                })
                            })
                        }
                    })
                } catch (e) {
                    throw e
                }
            },

            /**
             * Check if the network is synchronized the one of your choosing.
             * @param  {Function} fn [description]
             * @return {[type]}      [description]
             */
             checkNetwork: async fn => {
                return new Promise((res, rej) => {
                    Interface.Bridges.Metamask.web3.version.getNetwork(function (r, e) {
                        if (r) return rej(r)
                        if (e == "4") {
                            return res(true)
                        } else {
                            return res(false)
                        }
                    })
                    
                })
            },

            /**
             * Synchronize time with the server.
             * @param  {Function} fn [description]
             * @return {[type]}      [description]
             */
             synchronizeTime: async fn => {
                //
                try {
                    if (Interface.TimeDifference === false) {
                        let remote = { now: new Date().getTime()}
                        let local = new Date().getTime()
                        let diff = new Date().getTime() - remote.now
                        Interface.TimeDifference = (diff < 0) ? `+${diff.toString().slice(1)}` : `-${diff.toString()}`
                    }

                    if (Interface.TimeDifference.slice(0, 1) == "+") {
                        return new Date().getTime() + parseInt(Interface.TimeDifference.slice(1))
                    } else {
                        return new Date().getTime() - parseInt(Interface.TimeDifference.slice(1))
                    }
                } catch (e) {
                    throw e
                }
            },


            /**
             * Get a synchronized date object.
             * @param  {Function} fn [description]
             * @return {[type]}      [description]
             */
             date: fn => {
                if (Interface.TimeDifference === false) return new Date()
                    if (Interface.TimeDifference.slice(0, 1) == "+") {
                        return new Date(new Date().getTime() + parseInt(Interface.TimeDifference.slice(1)))
                    } else {
                        return new Date(new Date().getTime() - parseInt(Interface.TimeDifference.slice(1)))
                    }
                }
            }

            module.exports = Interface