//描述编译器版本
pragma solidity >=0.8.x <0.9.0;

//所有的语句都已分号结尾

//所有的语句都以contract开头，后面接着合约名字（大写字母开头）
//一个文件内可以有多个合约
contract Inbox{ 
    
    //定义变量：类型 + 变量名
    string public message;   // var name string
    
    
    function Inbox() payable {
        
    }
    
    function setMessage(string newMessage) public {
        string memory msg1 = newMessage;
        message = newMessage;
    }
    
    
    //如果有返回值，一定要加上returns关键字，使用()包裹起来    
    function getMessage() public constant returns(string){
        return message;
    }
}