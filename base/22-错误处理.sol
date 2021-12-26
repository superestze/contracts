//描述编译器版本
pragma solidity >=0.8.x <0.9.0;


contract Inbox{ 
    
    //定义变量：类型 + 变量名
    string public message;   // var name string
    address public manager; //合约的部署者（拥有者）
    address public caller;  //合约函数的调用者
    
    
    function Inbox() payable {
        manager = msg.sender;
    }
    
    function setMessage(string newMessage) public {
        caller = msg.sender;
        
        // if (manager != msg.sender) {
        //     throw; //如果函数调用者不是管理员，直接抛异常
        // }
        
        
        // 断言：
        // 1. 一条语句，既包含了条件，又可以抛异常（推荐）
        // 2. 条件是期望的结果，与普通的条件判断相反
        //   （条件为true，继续执行，条件为false，抛出异常）
        
        // require(manager == msg.sender);
        assert(manager == msg.sender);
        
        message = newMessage;
        
    }
    
    
    //如果有返回值，一定要加上returns关键字，使用()包裹起来    
    function getMessage() public constant returns(string){
        return message;
    }
}