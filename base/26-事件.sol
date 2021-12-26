pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    //定义一个事件
    event Deposit(address _from, uint _value);
    
    mapping(address => uint) public depositInfo;
    
    //在函数中使用
    function deposit() payable public {
        
        depositInfo[msg.sender] = msg.value;
        
        //发射事件
        emit Deposit(msg.sender, msg.value);
        
    }
    //可以在前端代码中监听捕捉
} 