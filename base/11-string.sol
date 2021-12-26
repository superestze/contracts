pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    string public name = "Lily";
    
    // - 引用类型
    // - 不支持下标索引
    // - 不支持length、push方法
    // - 可以修改(需通过bytes转换)
    
    // bytes与string可以进行灵活转换

    function getLength() public view returns (uint256) {
        return bytes(name).length;
    }
    
    function setLength() public {
        bytes(name).length = 10;
    }
    
    function changeName() public {
        bytes(name)[0] = "l";
    }
    
} 