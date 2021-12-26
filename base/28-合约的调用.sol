pragma solidity >=0.8.x <0.9.0;



contract TestB {
    TestA public a1;
    TestA public a2;
    TestA public a3;
    
    //第一种方式
    function getValue1() public returns(string) {
        
        address aAddr = new TestA("hello");
        
        a1 = TestA(aAddr);
        
        return a1.name();
    }
    
    //第二种方式
    function getValue2() public returns(string) {
        
        a2 = new TestA("hello");
        
        return a2.name();
    }
    
    //第三种方式：外部输入地址
    function getValue3(address _addr) public returns(string) {
        
        a3 = TestA(_addr);
        return a3.name();
    }
}


contract TestA {
    
    string public name;
    
    function TestA(string _name) public {
        name = _name;
    }
} 


