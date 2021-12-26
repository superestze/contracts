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
    
    function setMessage(string newMessage) public onlyManager onlyManager2(msg.sender){
        caller = msg.sender;
        message = newMessage;
    }
    
    //如果有返回值，一定要加上returns关键字，使用()包裹起来    
    function getMessage() public constant returns(string){
        return message;
    }
    
    modifier onlyManager {
        require(manager == msg.sender);
        _; //下划线代表修饰器所修饰的代码
    }
    
    modifier onlyManager2(address _caller) {
        require(manager == _caller);
        _; //下划线代表修饰器所修饰的代码
    }
}