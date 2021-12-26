pragma solidity >=0.8.x <0.9.0;


contract TestA {
    
    string public message;
    
    function invest(string _input) payable public {
        message = _input;    
    }
    
    function getBalanceA() public view returns(uint256) {
        return address(this).balance;
    }
} 



contract TestB {
    
    TestA public a1;
    
    constructor() public {
        a1 = new TestA();
    }
    
    function() public payable {
        
    }
    
    function pay() public {
        //TestB调用TestA的invest方法时，如何转账给TestA？
        a1.invest.value(5 ether).gas(21000)("hangtou!");
    }
    
    function getBalanceB() public view returns(uint256) {
        return address(this).balance;
    }
    
} 