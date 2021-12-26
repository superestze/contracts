//描述编译器版本
pragma solidity >=0.8.x <0.9.0;


contract Inbox{ 
    
    //定义变量：类型 + 变量名
    string public message;   // var name string
    address public manager; //合约的部署者（拥有者）
    address public caller;  //合约函数的调用者
    
    // msg.sender
    // 1. 合约的部署者（拥有者）
    // 2. 也可以是合约函数的调用者
    // 3. 如果合约A调用合约B，那么在B的方法中msg.sender就是合约A的地址
    
    // 总结：
    // Msg.sender它就是一个变量，它存储的是当前这笔交易的调用者

    
    function Inbox() payable {
        manager = msg.sender;
    }
    
    function setMessage(string newMessage) public {
        caller = msg.sender;
        if (manager != msg.sender) {
            throw; //如果函数调用者不是管理员，直接抛异常
        }
        
        message = newMessage;
        
    }
    
    
    //如果有返回值，一定要加上returns关键字，使用()包裹起来    
    function getMessage() public constant returns(string){
        return message;
    }
}