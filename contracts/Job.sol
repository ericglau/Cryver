pragma solidity >= 0.5.5 < 0.6.0;
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/IERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";
import "./Checkpoint.sol";

contract Job {

    address public payer;
    string public name;
    string public description;
    address[] public checkpoints;
    
    IERC20 token;

    constructor(address _payer, string memory _name, string memory _description, address tokenAddress) public {
        name = _name;
        description = _description;
        payer = _payer;
        
        address myTokenContractAddress = tokenAddress;//0xA113b22D40DC1D5D086003C27A556e597F614E8B;
		token = IERC20(myTokenContractAddress);

    }
    
    event logCreatedCheckpoint(string _description, uint bounty, address checkpointAddress);
    
    function addCheckpoint(string memory _description, uint bounty) public {
        
        Checkpoint checkpoint = new Checkpoint(_description, bounty, token);
        checkpoints.push(address(checkpoint));
        emit logCreatedCheckpoint(_description, bounty, address(checkpoint));
    }

}