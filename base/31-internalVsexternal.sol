pragma solidity >=0.8.x <0.9.0;


//private ,           intenal ,            external,            public
//合约本身可以调用，  合约及子类可以调用， 只能在合约外部调用， 可以被任意的合约调用

contract C1{
    uint public c = 10;
    
    function accessPrivate() private returns(uint) {
        return c;
    }
    
    function accessInternal() internal returns (uint){
        return c;
    }
    
    function accessExternal() external returns(uint){
        return c;
    }
    
    function call1() public returns(uint) {
        // accessExternal(); //无法在内部调用external修饰的函数
        accessInternal();
    }
    
    function call2() public {
        this.accessExternal(); //this调用函数，相当于外部调用
        
        // this.c;   // ok
        // uint a = this.c; // error
        uint b = this.c();   // ok
        // c();
    }
    
    function call3() public returns(uint) {
        
    }
}

contract C2{
    
    function callExternal() public returns(uint){
        C1 c1 = new C1();
        // external修饰的只能在外部调用
        return c1.accessExternal();
        
        //internal修饰的只能在内部调用
        // return c1.accessInternal();
    }
}

contract C3 is C1 {
    
    function test() public returns(uint) {
        // C1 c1 = new C1();
        // c1.accessPrivate();
        
        // this.accessInternal(); //error
        // c1.accessInternal(); // error
        return accessInternal();
        
    }
    
}





