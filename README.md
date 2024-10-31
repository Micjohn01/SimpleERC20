# MyERCToken

**MyERCToken** is an ERC-20 compatible token contract built on the Ethereum blockchain. This contract allows for basic minting, burning, and transferring of tokens with added ownership control. The contract includes OpenZeppelin's ERC-20 standard implementation for robustness and security.

## Features

**Minting:** Only the owner can mint new tokens, ensuring controlled token issuance.

**Burning:** Any holder can burn a portion of their balance, reducing the total supply.

**Transferring:** Allows transferring tokens between addresses with added validation.

**Balance and Total Supply:** Easily retrieve token balances of any address and check total supply.

## Deployment

Deploy the contract by providing the token name and symbol as parameters to the constructor.

## Functions
1. mint(address to, uint256 amount)

Description: Mints new tokens to the specified address.

Access: Owner-only.

2. burn(uint256 amount)

Description: Burns a specified amount of tokens from the caller’s balance.

Access: Public.


3. transfer(address to, uint256 amount)

Description: Transfers a specified amount of tokens to another address.

Access: Public.


4. getBalance(address account)

Description: Returns the token balance of the specified address.

5. getTotalSupply()

Description: Returns the total supply of tokens.

6. decimals()

Description: Returns the number of decimals used by the token (default: 18).

## Events

TokensMinted(address indexed to, uint256 amount): Emitted when tokens are minted.

TokensBurned(address indexed from, uint256 amount): Emitted when tokens are burned.

TokensTransferred(address indexed from, address indexed to, uint256 amount): Emitted when tokens are transferred.

## Usage

To interact with the contract, make sure you are the owner to access mint functionality, or hold a balance if using burn or transfer.

## License

This project is licensed under the MIT License.