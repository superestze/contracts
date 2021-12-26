pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    
    
    bytes10 public b10 = 0x68656c6c6f776f726c64; //helloworld
    
    bytes public bytesInfo = new bytes(b10.length);
    
    
    // 1. 由固定长度数组转换为bytes
    function fixedByte2Bytes() public {
        
        for (uint i = 0; i < b10.length ; i++) {
            bytesInfo[i] = b10[i];
        }
    }
    
    bytes public bytesInfo1;
    function fixedByte2Bytes1() public {
        
        for (uint i = 0; i < b10.length ; i++) {
            bytesInfo1.push(b10[i]);
        }
    }
    
    // 2. 由bytes转换为string
    string public helloworld;
    
    function bytes2String() public {
        fixedByte2Bytes(); //0x68656c6c6f776f726c64
        
        helloworld = string(bytesInfo);
    }
    
    //3. 由string转换为bytes
    function string2Bytes() public  returns(bytes){
        bytes2String();
        
        return bytes(helloworld);
    }
    
    
    // function fixedByes2String() public {
    //     string(b10);
    // }
} 