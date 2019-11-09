pragma solidity >= 0.5.5 < 0.6.0;

contract Voting {
    
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

}