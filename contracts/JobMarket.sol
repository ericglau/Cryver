pragma solidity >= 0.5.5 < 0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/ERC20.sol";

import "./Job.sol";
import "./Token.sol";

contract JobMarket {
    
    // set existing stablecoin token address here
    address tokenAddress = 0xA113b22D40DC1D5D086003C27A556e597F614E8B;
    
    //--------- Voting -------------
    
    mapping(address => uint) public addedRating;
    mapping(address => uint) public numAddedRatings;
    
    event updatedRating(address party, uint averageRating);
    
    function rate(address party, uint rating) external
    // TODO ensure party has been interacted with but not previously rated
    {
        addedRating[party] += rating;
        numAddedRatings[party] += 1;
        emit updatedRating(party, getAverageRating(party));
    }

    // get average rating
    function getAverageRating(address party)
    public
    view
    returns (uint)
    {
        return addedRating[party] / numAddedRatings[party];
    } 
    
    
    // -------- Interacting with jobs -------------

    
    // mapping from creator address to job address
    mapping(address => address) public jobs;
    
    event logCreatedJob(address payer, address job, string name);

    function createJob(string memory name, string memory description) public {
        Job job = new Job(msg.sender, name, description, tokenAddress);
        emit logCreatedJob(msg.sender, address(job), name);
        jobs[msg.sender] = address(job);
    }
    
    // for demo only, create a new token and give it to the owner
    function setTokenAddress(address _tokenAddress) public {
        tokenAddress = _tokenAddress;
    }

}