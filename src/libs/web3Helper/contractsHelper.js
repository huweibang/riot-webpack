        var Promise = require('bluebird')
        var contractsDetails = require('./contractDefinition.js')
        _ = require('lodash')

        class Bridge {
            constructor(params) {
                var $this = this
                riot.observable(this)
                this.listeners = {}
                this.contracts = []
                this._lastWallet = ''
                this.options = _.merge({
                    web3: false
                }, params)

                if (!this.options.web3) {
                    throw "MissingParam: Please provide a web3 parameter to interact with. This can either be a string pointing to the HTTP RPC, or a pre-constructed web3 instance."
                }

                if (typeof this.options.web3 === "string") {
                    this.web3 = new Web3(new Web3.providers.HttpProvider(this.options.web3))
                } else {
                    this.web3 = this.options.web3
                }
                this.signedIn = this.web3.eth.defaultAccount ? true : false
                if (this.signedIn){
                    this._lastWallet = this.web3.eth.defaultAccount
                    this.trigger('account.signedIn')
                }
                this.listeners.signedIn = setInterval(function () {
                    if(($this._lastWallet != $this.web3.eth.defaultAccount) && $this.web3.eth.defaultAccount && $this._lastWallet){
                        location.reload()
                    }else if (($this._lastWallet != $this.web3.eth.defaultAccount) && $this.web3.eth.defaultAccount) {
                        $this.signedIn = ($this.web3.eth.defaultAccount ? true : false)
                        $this._lastWallet = $this.web3.eth.defaultAccount ? $this.web3.eth.defaultAccount : ''
                        $this.trigger('account.signedIn')
                    }
                }, 1000)
            }

            wallet() {
                if (this.web3.version.api && this.web3.version.api.includes("0.2")) {
                    return this.web3.eth.defaultAccount
                } else if (this.web3.version.includes("1.")) {
                    return this.web3.eth.defaultAccount
                } else {
                    throw "InvalidType: Unrecognized web3js version. Are you sure this is a web3js instance?"
                }
            }
        }

        /**
         * Universal contract wrapper contract to interface with the blockchain. 
         * Can use a myriad of different sourced bridge providers. 
         */
        class Contract {
            constructor(params) {
                riot.observable(this)
                this.options = _.merge({
                    address: false,
                    bridge: false,
                    ABI: false,
                    API: false,
                    name: 'Contract',
                }, params)

                this.listeners = {}

                this.name = this.options.name

                if (!this.options.bridge) {
                    throw "MissingParam: Please provide a bridge object to attach to."
                }


                if (typeof this.options.bridge !== "object") {
                    throw "InvalidType: Please provide a valid bridge object to attach to."
                } else {
                    this.bridge = this.options.bridge
                }

                if (this.bridge.web3.version.api && this.bridge.web3.version.api.includes("0.2")) {
                    this.API = this.bridge.web3.eth.contract(this.options.ABI).at(this.options.address)
                } else if (this.bridge.web3.version.includes("1.")) {
                    this.API = new this.bridge.web3.eth.Contract(this.options.ABI, this.options.address)
                } else {
                    throw "InvalidType: Unrecognized web3js version. Are you sure this is a web3js instance?"
                }
            }

            /**
             * Perform a read call on a specific accessor.
             * @param  {Function} fn     [description]
             * @param  {[type]}   params [description]
             * @return {[type]}          [description]
             */
            async read(fn, params) {
                if (this.bridge.web3.version.api && this.bridge.web3.version.api.includes("0.2")) {
                    if (!params || typeof params === "undefined") params = []
                    if (!Array.isArray(params)) params = [params]
                    return new Promise((res, rej) => {
                        params.push(function (err, data) {
                            if (err) return rej(err)
                            return res(data)
                        })
                        this.API[fn].apply(null, params)
                    })
                } else if (this.bridge.web3.version.includes("1.")) {
                    if (!params || typeof params === "undefined") params = []
                    if (!Array.isArray(params)) params = [params]
                    try {
                        return this.API.methods[fn].apply(null, params).call()
                    } catch (e) {
                        console.error(`Unknown method "${fn}" in contract "${this.name}".`)
                        console.log(e)
                    }

                } else {
                    throw "InvalidType: Unrecognized web3js version. Are you sure this is a web3js instance?"
                }
            }

            /**
             * Perform a read call on a specific accessor.
             * @param  {Function} fn     [description]
             * @param  {[type]}   params [description]
             * @return {[type]}          [description]
             */
            async write(fn, params, metadata) {
                if (this.bridge.web3.version.api && this.bridge.web3.version.api.includes("0.2")) {
                    if (!params || typeof params === "undefined") params = []
                    if (!Array.isArray(params)) params = [params]
                    return new Promise((res, rej) => {
                        if (metadata && typeof metadata === "object") params.push(metadata)
                        var transactionObject = {
                            from:Interface.Bridges.Metamask._lastWallet,
                            gasPrice: '30000000000'
                        }
                        params.push(transactionObject)
                        params.push(function (err, data) {
                            console.log(err,data)
                            if (err) return rej(err)
                            return res(data)
                        })
                        try {
                            this.API[fn].apply(null, params)
                        } catch (e) {
                            console.error(`Unknown method "${fn}" in contract "${this.name}".`)
                        }

                    })
                } else if (this.bridge.web3.version.includes("1.")) {
                    if (!params || typeof params === "undefined") params = []
                    if (!Array.isArray(params)) params = [params]
                    if (!metadata || typeof metadata !== "object") metadata = {}
                    try {
                        return this.API.methods[fn].apply(null, params,{from:Interface.Bridges.Metamask._lastWallet,gasPrice:Web3.utils.toWei('30','gwei')}).send(metadata)
                    } catch (e) {
                        console.error(`Unknown method "${fn}" in contract "${this.name}".`)
                    }

                } else {
                    throw "InvalidType: Unrecognized web3js version. Are you sure this is a web3js instance?"
                }
            }

            /**
             * Setup listeners
             */
            async listen() {
                var $this = this
                if (!this.bridge.web3.version.includes("1.")) throw "InvalidVersion: This version of web3js does not support events"
                if (this.listeners.ws) this.listeners.ws.unsubscribe()
                try {
                    console.log("Setting up event listeners..")
                    this.listeners.ws = this.API.events.allEvents(function (err, event, sub) {
                        console.log("incoming..")
                        var tt = typeof err
                        console.log("Bridge reporting", err, event, sub, tt)
                        if (err) {
                            console.log("closing and reopening..", err, event, sub)
                            this.listen()
                            return
                        } else {                   
                            $this.trigger('ContractEvent', event)
                        }
                    })
                } catch (e) {
                    console.log(e)
                    //Bridge.methods.connectWithBlockchain()
                    return
                }
            }
        }
        class LuckyStar extends Contract {
            constructor(params){
                super(_.merge({
                    name:'LuckyStar',
                    ABI:contractsDetails['LuckyStar'].ABI
                },params))

            }
        }

        module.exports = {
            Bridge: Bridge,
            Contract: Contract,
            LuckyStar
        }