module.exports = {
	LuckyStar:{
		name:'LuckyStar',
		address:"0xcdc0e770de115e48309f26d58b62d28a6fb4c768",
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
	}
}