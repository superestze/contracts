pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    
    //T[len] name
    
    uint256[10] numbers = [1,2,3,4,5,6,7,8,9,10];
    uint256 public sum;
    
    // - 类型T，长度K的数组定义为T[K]，例如：uint [5] numbers,  byte [10] names;
    // - 内容可变
    // - 长度不可变，不支持push
    // - 支持length方法

    function getSum() public returns(uint256) {
        for (uint i = 0; i< numbers.length; i++) {
            sum += i;
        }
    }
} 