pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    function add(uint a, uint b) public view returns(uint) {
        return a + b;
    }
    
    function isEqual() view returns(bool){
        return 10 == 20;
    }
    
    function minus(uint a, uint b) public view returns(int) {
        return int(a - b);
    }
}