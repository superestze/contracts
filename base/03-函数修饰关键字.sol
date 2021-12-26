pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    uint256 public res = 0;
    
    function add(uint a, uint b) private view returns(uint) {
        return a + b;
    }
    
    //b. view/constant: 表示这个函数里面不会修改状态变量, 只是去读取状态变量，即使修改了也不会生效
    function isEqual1() public constant returns(bool){
        res = 100;
        return 10 == 20;
    }
    
    //c. pure：这个函数没有使用状态变量
    function isEqual2() public pure returns(bool){
        //res = 100;
        return 10 == 20;
    }
    
    //d. 如果函数内部修改了状态变量，就都不要使用
    function isEqual3() public returns(bool){
        res = 100;
        return 10 == 20;
    }
    

    
    function minus(uint a, uint b) public view returns(int) {
        return int(a - b);
    }
    
    function getRes() public view returns(uint256) {
        return res;
    }
    
}