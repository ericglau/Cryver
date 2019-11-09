pragma solidity >= 0.5.5 < 0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/ERC20.sol";
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
    /*
    // closeJob
    // return balance to payer

	//Track balcnaces
	mapping(address => uint256) public balanceOf;
	mapping(address=>mapping(address=>uint256)) public allowance;
	mapping(address => mapping(address => uint256)) public tokens;
	mapping(address=>uint256) public Payerbalance;
	


	//Send tokens
    //event
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Deposit(address token, address user, uint256 amount, uint256 balance);
    event Withdraw(address token, address user, uint256 amount, uint256 balance);
    
    
    function depositToken(address _token, uint _amount) public {
        require(Token(_token).transferFrom(msg.sender, address(this), _amount));
        tokens[_token][msg.sender] = tokens[_token][msg.sender] + _amount;
        emit Deposit(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }

    function withdrawToken(address _token, uint256 _amount) public {
        require(tokens[_token][msg.sender] >= _amount);
        tokens[_token][msg.sender] = tokens[_token][msg.sender]- _amount;
        require(Token(_token).transfer(msg.sender, _amount));
        emit Withdraw(_token, msg.sender, _amount, tokens[_token][msg.sender]);
    }

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));
        balanceOf[_from] = balanceOf[_from] - _value;
        balanceOf[_to] = balanceOf[_to]+ _value;
        emit Transfer(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0));
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] = allowance[_from][msg.sender]- _value;
        _transfer(_from, _to, _value);
        return true;
    }*/

}