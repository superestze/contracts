pragma solidity >=0.8.x <0.9.0;


contract Test {

    // 1. 引用类型的变量，既可以进行值拷贝的，也可以当做引用类型不拷贝
    // 2. 如果想使用引用功能，需要使用storage修饰
    
    string public name = "lily";
    
    // 如果不修饰，默认是memory的
    // function changeName1(string _name) pure private {
    function changeName1(string memory _name)  private {
        bytes(_name)[0] = "L";
    }
    
    function call1() public  {
        changeName1(name);
    }
    
    function changeName2(string storage _name)  private {
        bytes(_name)[0] = "L";
    }
    
    function call2() public  {
        changeName2(name);
    }
    
    function localTest() public {
        // 如果是引用类型的局部变量，默认是storage，此时对局部变量的修改，会影响到赋值的变量
        //string str = name;
        string storage str = name;
        
        bytes(str)[3] = "Y";
    }
    
    function localTest1() public  {
 
        string memory str = name;
        
        bytes(str)[3] = "Y";
    }
} 