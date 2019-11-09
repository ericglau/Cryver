pragma solidity >= 0.5.5 < 0.6.0;

contract Checkpoint {

    string public description;
    bool public completed;
    bool public accepted;
    bool public rejected;

    constructor(string memory _description) public {
        description = _description;
    }
    
    function pay() payable public {
    }
    
}