pragma solidity ^0.5.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20Detailed.sol";

contract Token is ERC20, ERC20Detailed {

    constructor() public ERC20Detailed("TrueCAD", "TCAD", 18) {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
    
    function mint() public {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}