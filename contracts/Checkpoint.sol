pragma solidity >= 0.5.5 < 0.6.0;
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/IERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";

contract Checkpoint {
    
    

    string public description;
    bool public completed;
    bool public accepted;
    bool public rejected;
    bool public cancelled;
    
    address public owner;
    address public freelancer;
    
    uint bounty;
    string public url;
    
    uint public balance;


    constructor(string memory _description, uint _bounty, IERC20 _token) public {
        owner = tx.origin;
        description = _description;
        bounty = _bounty;
        associatedToken = _token;
    }
    
    
    IERC20 public associatedToken;
    
    event logFunded(uint balance, uint bounty);
    event logCompleted(string url, address freelancer);
    event logAccepted(string url, uint transferredBalance, address freelancer);
    event logRejected(string url);
    event logCancelled(address refundedAddress, uint refundedBalance);
    
    
    function fund(uint tokenAmount) public payable {

// TODO user needs to manually do this

        associatedToken.approve(msg.sender, tokenAmount);
        
        // transfer the tokens from the sender to this contract
        associatedToken.transferFrom(msg.sender, address(this), tokenAmount);

        // add the deposited tokens into existing balance 
        balance += tokenAmount;
        
        emit logFunded(balance, bounty);
    }
    
    // freelancer completed work and provided url of work
    function complete(string memory _url) public {
        require(
            balance >= bounty,
            "Contract not fully funded yet."
        );
        
        url = _url;
        freelancer = msg.sender;
        completed = true;
        rejected = false;
        emit logCompleted(url, freelancer);
    }
    
    // payer approves the completed work
    function approve() public payable
    {
        require(
            msg.sender == owner,
            "Sender not authorized."
        );
        
        require(
            balance >= bounty,
            "Contract not fully funded yet."
        );
        
        accepted = true;
        associatedToken.transfer(freelancer, balance);
        emit logAccepted(url, balance, freelancer);
        balance = 0;
    }
    
    // payer rejects the completed work
    function reject() public 
    {
        require(
            msg.sender == owner,
            "Sender not authorized."
        );
        
        require(
            balance >= bounty,
            "Contract not fully funded yet."
        );
        
        rejected = true;
        completed = false;
        emit logRejected(url);
    }
    
    // payer cancels this work
    function cancel() public payable
    {
        require(
            msg.sender == owner,
            "Sender not authorized."
        );
        
        cancelled = true;
        associatedToken.transfer(owner, balance);
        emit logCancelled(owner, balance);
        balance = 0;
    }
    

    
    
}