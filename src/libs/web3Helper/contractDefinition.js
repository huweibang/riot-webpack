// 测试合约
module.exports = {
	Register:{
		name:'Register',
		address:"0x3fb5db410ed906938c5999218363bf63ef5a9d5a",
		ABI:[
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getDirectInvitations",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_refCode",
				"type": "address"
			}
			],
			"name": "register",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getRelationChain",
			"outputs": [
			{
				"name": "",
				"type": "address[13]"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_addrList",
				"type": "address[]"
			}
			],
			"name": "importSeedPlayer",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_code",
				"type": "address"
			}
			],
			"name": "isInvitationVode",
			"outputs": [
			{
				"name": "",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getDirectReferences",
			"outputs": [
			{
				"name": "",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "owner_",
			"outputs": [
			{
				"name": "",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getNumberOfInvited",
			"outputs": [
			{
				"name": "",
				"type": "uint256[13]"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_newOwner",
				"type": "address"
			}
			],
			"name": "transferOwnership",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"inputs": [
			{
				"name": "_owenr",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "constructor"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "player",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "inviter",
				"type": "address"
			}
			],
			"name": "LogRegistered",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "seedPlayer",
				"type": "address[]"
			}
			],
			"name": "LogSeedPlayer",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "newOwner",
				"type": "address"
			}
			],
			"name": "LogOwnershipTransferred",
			"type": "event"
		}
		]
	},
	Payment:{
		name:'Payment',
		address:"0x8241f7509166a8132dfe0de8aa24ece6fee966af",
		ABI:[
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_stop",
				"type":  "bool"
			}
			],
			"name":  "pause",
			"outputs":  [
			{
				"name":  "success",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [],
			"name":  "terminate",
			"outputs":  [
			{
				"name":  "success",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_from",
				"type":  "address"
			},
			{
				"name":  "_amount",
				"type":  "uint256"
			}
			],
			"name":  "BurnFrom",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "pause_",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "stopFlag_",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "TO",
			"outputs":  [
			{
				"name":  "",
				"type":  "address"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [],
			"name":  "renounceOwnership",
			"outputs":  [],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [],
			"name":  "acceptOwnership",
			"outputs":  [],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "owner",
			"outputs":  [
			{
				"name":  "",
				"type":  "address"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_LS",
				"type":  "address"
			}
			],
			"name":  "setLS",
			"outputs":  [],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "LuckeyStars_",
			"outputs":  [
			{
				"name":  "",
				"type":  "address"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [
			{
				"name":  "_user",
				"type":  "address"
			}
			],
			"name":  "getBurnAmount",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint256"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "newOwner",
			"outputs":  [
			{
				"name":  "",
				"type":  "address"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function" 
		},
		{
			"constant": true,
			"inputs": [],
			"name": "token_",
			"outputs": [
			{
				"name": "",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "getTMXprice",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_from",
				"type": "address"
			},
			{
				"name": "_value",
				"type": "uint256"
			}
			],
			"name": "isPayable",
			"outputs": [
			{
				"name": "",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_newOwner",
				"type": "address"
			}
			],
			"name": "transferOwnership",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_newPrice",
				"type": "uint256"
			}
			],
			"name": "setTMXprice",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"inputs": [
			{
				"name": "_token",
				"type": "address"
			},
			{
				"name": "_owner",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "constructor"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "stopTime",
				"type": "uint256"
			}
			],
			"name": "LogStopPay",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "status",
				"type": "bool"
			},
			{
				"indexed": false,
				"name": "changeTime",
				"type": "uint256"
			}
			],
			"name": "LogPausePay",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "newPrice",
				"type": "uint256"
			}
			],
			"name": "LogUpdateTMXPrice",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			}
			],
			"name": "LogOwnershipRenounced",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "newOwner",
				"type": "address"
			}
			],
			"name": "LogOwnershipTransferred",
			"type": "event"
		}
		]
	},
	TMX:{
		name:'TMX',
		address:"0x9d6f24c15f2774af9daf30c7ee35b95eaa8f75aa",
		ABI:[
		{
			"constant":  true,
			"inputs":  [],
			"name":  "mintingFinished",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "name",
			"outputs":  [
			{
				"name":  "",
				"type":  "string"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_spender",
				"type":  "address"
			},
			{
				"name":  "_value",
				"type":  "uint256"
			}
			],
			"name":  "approve",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "totalSupply",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint256"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_from",
				"type":  "address"
			},
			{
				"name":  "_to",
				"type":  "address"
			},
			{
				"name":  "_value",
				"type":  "uint256"
			}
			],
			"name":  "transferFrom",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "INITIAL_SUPPLY",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint256"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "decimals",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint8"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "MAX_SUPPLY",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint256"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "cap",
			"outputs":  [
			{
				"name":  "",
				"type":  "uint256"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [],
			"name":  "unpause",
			"outputs":  [],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  false,
			"inputs":  [
			{
				"name":  "_to",
				"type":  "address"
			},
			{
				"name":  "_amount",
				"type":  "uint256"
			}
			],
			"name":  "mint",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "nonpayable",
			"type":  "function"
		},
		{
			"constant":  true,
			"inputs":  [],
			"name":  "paused",
			"outputs":  [
			{
				"name":  "",
				"type":  "bool"
			}
			],
			"payable":  false,
			"stateMutability":  "view",
			"type":  "function"
		},
		{
			"constant" : false,
			"inputs": [
			{
				"name": "_spender",
				"type": "address"
			},
			{
				"name": "_subtractedValue",
				"type": "uint256"
			}
			],
			"name": "decreaseApproval",
			"outputs": [
			{
				"name": "success",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_owner",
				"type": "address"
			}
			],
			"name": "balanceOf",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [],
			"name": "renounceOwnership",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [],
			"name": "finishMinting",
			"outputs": [
			{
				"name": "",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [],
			"name": "pause",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "owner",
			"outputs": [
			{
				"name": "",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "symbol",
			"outputs": [
			{
				"name": "",
				"type": "string"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_to",
				"type": "address"
			},
			{
				"name": "_value",
				"type": "uint256"
			}
			],
			"name": "transfer",
			"outputs": [
			{
				"name": "",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_spender",
				"type": "address"
			},
			{
				"name": "_addedValue",
				"type": "uint256"
			}
			],
			"name": "increaseApproval",
			"outputs": [
			{
				"name": "success",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_owner",
				"type": "address"
			},
			{
				"name": "_spender",
				"type": "address"
			}
			],
			"name": "allowance",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "newOwner",
				"type": "address"
			}
			],
			"name": "transferOwnership",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"inputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "constructor"
		},
		{
			"payable": true,
			"stateMutability": "payable",
			"type": "fallback"
		},
		{
			"anonymous": false,
			"inputs": [],
			"name": "Pause",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [],
			"name": "Unpause",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "to",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "amount",
				"type": "uint256"
			}
			],
			"name": "Mint",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [],
			"name": "MintFinished",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			}
			],
			"name": "OwnershipRenounced",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "newOwner",
				"type": "address"
			}
			],
			"name": "OwnershipTransferred",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "owner",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "spender",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "value",
				"type": "uint256"
			}
			],
			"name": "Approval",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "from",
				"type": "address"
			},
			{
				"indexed": true,
				"name": "to",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "value",
				"type": "uint256"
			}
			],
			"name": "Transfer",
			"type": "event"
		}
		]
	},
	LuckyStars:{
		name:'LuckyStars',
		address:"0x5929992646fabe2bd932032c3245610a19d31920",
		ABI:[
		{
			"constant": false,
			"inputs": [],
			"name": "activate",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [],
			"name": "buy",
			"outputs": [],
			"payable": true,
			"stateMutability": "payable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [
			{
				"name": "_eth",
				"type": "uint256"
			}
			],
			"name": "reLoadBuy",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"constant": false,
			"inputs": [],
			"name": "withdraw",
			"outputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "function"
		},
		{
			"inputs": [],
			"payable": false,
			"stateMutability": "nonpayable",
			"type": "constructor"
		},
		{
			"payable": true,
			"stateMutability": "payable",
			"type": "fallback"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "rID",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "winner",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "value",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "next",
				"type": "uint256"
			}
			],
			"name": "LogTimeEndRound",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "rID",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "winner",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "value",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "next",
				"type": "uint256"
			}
			],
			"name": "LogQuantityEndRound",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "rID",
				"type": "uint256"
			},
			{
				"indexed": true,
				"name": "phase",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "winner",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "value",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "next",
				"type": "uint256"
			}
			],
			"name": "LogQuantityAward",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": false,
				"name": "rID",
				"type": "uint256"
			},
			{
				"indexed": true,
				"name": "player",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "eth",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "keys",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "TMX",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "time",
				"type": "uint256"
			}
			],
			"name": "LogBuy",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "player",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "eth",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "time",
				"type": "uint256"
			}
			],
			"name": "LogWithdraw",
			"type": "event"
		},
		{
			"anonymous": false,
			"inputs": [
			{
				"indexed": true,
				"name": "AirdropRound",
				"type": "uint256"
			},
			{
				"indexed": true,
				"name": "lucky",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "award",
				"type": "uint256"
			},
			{
				"indexed": false,
				"name": "time",
				"type": "uint256"
			}
			],
			"name": "LogAirdrop",
			"type": "event"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_rID",
				"type": "uint256"
			},
			{
				"name": "_eth",
				"type": "uint256"
			}
			],
			"name": "calcKeysReceived",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "getBuyPrice",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "getCurrentRoundInfo",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "address"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getPlayerAffValue",
			"outputs": [
			{
				"name": "",
				"type": "uint256[13]"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_player",
				"type": "address"
			}
			],
			"name": "getPlayerInfoByAddress",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "getTimeLeft",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "_keys",
				"type": "uint256"
			}
			],
			"name": "iWantXKeys",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "name",
			"outputs": [
			{
				"name": "",
				"type": "string"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "",
				"type": "address"
			}
			],
			"name": "plyr_",
			"outputs": [
			{
				"name": "win",
				"type": "uint256"
			},
			{
				"name": "gen",
				"type": "uint256"
			},
			{
				"name": "aff",
				"type": "uint256"
			},
			{
				"name": "bon",
				"type": "uint256"
			},
			{
				"name": "bnk",
				"type": "uint256"
			},
			{
				"name": "lrnd",
				"type": "uint256"
			},
			{
				"name": "lphs",
				"type": "uint256"
			},
			{
				"name": "eth",
				"type": "uint256"
			},
			{
				"name": "withdraw",
				"type": "uint256"
			},
			{
				"name": "dref",
				"type": "address"
			},
			{
				"name": "dinv",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "",
				"type": "address"
			},
			{
				"name": "",
				"type": "uint256"
			}
			],
			"name": "plyrRnds_",
			"outputs": [
			{
				"name": "eth",
				"type": "uint256"
			},
			{
				"name": "keys",
				"type": "uint256"
			},
			{
				"name": "mask",
				"type": "uint256"
			},
			{
				"name": "closed",
				"type": "bool"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "rID_",
			"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"name": "round_",
			"outputs": [
			{
				"name": "plyr",
				"type": "address"
			},
			{
				"name": "strt",
				"type": "uint256"
			},
			{
				"name": "end",
				"type": "uint256"
			},
			{
				"name": "ended",
				"type": "bool"
			},
			{
				"name": "keys",
				"type": "uint256"
			},
			{
				"name": "eth",
				"type": "uint256"
			},
			{
				"name": "pot",
				"type": "uint256"
			},
			{
				"name": "mask",
				"type": "uint256"
			},
			{
				"name": "phase",
				"type": "uint256"
			},
			{
				"name": "award",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
			],
			"name": "rque_",
			"outputs": [
			{
				"name": "plynum",
				"type": "uint256"
			},
			{
				"name": "off20",
				"type": "uint256"
			},
			{
				"name": "off50",
				"type": "uint256"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		},
		{
			"constant": true,
			"inputs": [],
			"name": "symbol",
			"outputs": [
			{
				"name": "",
				"type": "string"
			}
			],
			"payable": false,
			"stateMutability": "view",
			"type": "function"
		}
		]
	}
}