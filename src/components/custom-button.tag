<custom-button>
	<div class="{custom-button:true,animated:opts.animated}"><yield /></div>
	<style>
	.custom-button {
		display: block;
		font-weight: 400;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		border: 1px solid transparent;
		padding: .375rem .75rem;
		font-size: 1.25rem;
		line-height: 1.5;
		border-radius: .25rem;
		transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		background-image: linear-gradient(90deg, rgb(2, 229, 209) 0%, rgb(67, 145, 253) 100%);
		
		color: white;
		cursor: pointer;
	}
	.custom-button.animated {
		animation: custom-button-anime 0.75s infinite;

	}
	.custom-button.animated:hover {
		box-shadow: none;
		text-shadow: none;
	}
	.custom-button:hover {
		box-shadow: 0 0 2px #02E4D1, 0 0 25px #02E4D1, 0 0 5px #02E4D1;
		text-shadow: 0 0 2px #02E4D1;
	}
	@keyframes custom-button-anime {
		0% {
			box-shadow: 0 0 0 0 rgba(2, 228, 209, 0.8);
		}
		70% {
			box-shadow: 0 0 0 5px rgba(2, 228, 209, 0.3);
		}
		100% {
			box-shadow: 0 0 0 10px rgba(2, 228, 209, 0);
		}
	}
</style>
</custom-button>