pragma solidity >=0.8.x <0.9.0;



contract Test {
    
    //构造函数：在创建对象时唯一调用一次的函数，用于对象的初始
    // 1. 合约同名函数（废弃）
    
    // function Test() public {
        
    // }
    
    // 2. constructor关键字（建议）
    
    string public name;
    
    constructor(string _name) payable public {
        name = _name;
    }
    
    function invest() payable public {
        
    }
    
    function getBalance() public view returns(uint256) {
        return this.balance;
    }
} 