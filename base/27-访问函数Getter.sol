pragma solidity >=0.8.x <0.9.0;


contract TestA {
    
    string public name = "hello world";
    
    //对于修饰为public的状态变量，会自动的创建一个同名的访问函数
    // function name() public view returns(string){
    //     return name;
    // }
    
    function TestA() public {
        // name = "hello";
    }
    
    
    function getName() public view returns(string) {
        return name;
    }
    
    function setName(string _name) public {
        name = _name;
    }
} 


contract TestB {
    // 想在合约TestB中调用合约TestA的方法
    
    function getValue() public  returns(string){
        TestA a = new TestA();
        return a.name();
    }
}