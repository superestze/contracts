pragma solidity >=0.8.x <0.9.0;


contract Test {
    bytes1 public b1 = "h"; 
    
    bytes10 public b10 = "hello";
    
    // - 长度可以读取 length
    // - 长度不可以修改
    // - 可以通过下标访问
    // - 内容不可修改  
    
    function getLen() public view returns(uint256) {
        // b10.length = 200;
        return b10.length;
    }


    function getValue(uint256 _i) public view returns(byte) {
        return b10[_i];
    }
    
    
    // function setValue(int256 _i) public {
    function setValue(uint256 _i) public {
        // b10[_i] = "L";
    }
} 