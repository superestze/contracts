pragma solidity >=0.8.x <0.9.0;


contract Test {
    
// - 动态字节数组
// - 引用类型(表明可以使用storage来修饰，进行引用传递，指针的效果)
// - 支持下标索引
// - 支持length、push方法(push会帮助分配空间的)
// - 可以修改

    bytes public name="Lily";
    
    
    function getValue(uint256 _i) public view returns(byte){
        return name[_i];
    }
    
    function setValue(bytes _input) public {
        name = _input;
    }
    
    function setValieByIndex() public {
        name[2] = "X";
    }
    
    function getLength() public view returns(uint256) {
        return name.length;
    }
    
    function setLen(uint256 _newLen) public {
        name.length = _newLen;
    }
    
    
    function pushData(byte _info) public {
        name.push(_info);
    } 
    
} 