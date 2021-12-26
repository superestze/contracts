pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    string public name;
    
    address manager;
    
    constructor(string _input) public payable {
        name = _input;
        manager = msg.sender;
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
    
    
    function kill() public {
        
        require(manager == msg.sender) ;
        
        selfdestruct(msg.sender);
    }
    
} 