// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERCToken is ERC20 {
    address public owner;
    uint8 private _decimals = 18;


    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint tokens");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
    }

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed from, uint256 amount);
    event TokensTransferred(address indexed from, address indexed to, uint256 amount);

    
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to zero address");
        require(amount > 0, "Mint amount must be greater than zero");
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    
    function burn(uint256 amount) public {
        require(amount > 0, "You can't burn zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance for burn");
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

   
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        require(to != address(0), "Cannot transfer to zero address");
        require(amount > 0, "Transfer must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance for transfer");
        
        bool success = super.transfer(to, amount);
        require(success, "Transfer failed");
        emit TokensTransferred(msg.sender, to, amount);
        return true;
    }

    function getBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply();
    }

    function decimals() public view override returns (uint8) {
        return _decimals;
    }
}