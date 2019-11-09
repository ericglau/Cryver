pragma solidity >= 0.5.5 < 0.6.0;
import "./Checkpoint.sol";

contract Job {

    address public payer;
    string public name;
    string public description;
    address[] public checkpoints;

    constructor(address _payer, string memory _name, string memory _description) public {
        name = _name;
        description = _description;
        payer = _payer;
    }
    
    event logCreatedCheckpoint(string _description, uint price);
    
    function addCheckpoint(string memory _description) public payable {
        
        Checkpoint checkpoint = new Checkpoint(_description);
        checkpoint.pay.value(msg.value);
        checkpoints.push(address(checkpoint));
        emit logCreatedCheckpoint(_description, msg.value);
    }

}