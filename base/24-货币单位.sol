pragma solidity >=0.8.x <0.9.0;

contract EthUnit{
    uint  a = 1 ether;
    uint  b = 10 ** 18 wei;
    uint  c = 1000 finney;
    uint  d = 1000000 szabo;
    
    function f1() constant public returns (bool){
        return a == b;
    }
    
    function f2() constant public returns (bool){
        return a == c;
    }
    
    function f3() constant public returns (bool){
        return a == d;
    }
    
    function f4() constant public returns (bool){
        return 1 ether == 100 wei;
    }
}