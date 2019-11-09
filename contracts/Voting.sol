pragma solidity >= 0.5.5 < 0.6.0;
import "./Job.sol";

contract Voting {
    
    
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
        Job job = new Job(msg.sender, name, description);
        emit logCreatedJob(msg.sender, address(job), name);
        jobs[msg.sender] = address(job);
    }

}