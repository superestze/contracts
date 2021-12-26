pragma solidity >=0.8.x <0.9.0;

contract Test {
    
    // sha3是一个标准的哈希函数
    // Solidity的sha3函数里面最初与标准的函数是一样的
    // 后来做了修改，为了不引起混淆，所以专门命名了这个函数为：keccak256
    
    bytes32 public hash = sha3("hello", 2, 3, "xxxx");
    
    
    bytes32 public hash1 = keccak256("hello", 2, 3, "xxxx");
    
    
    // 1. 使用keccak256来代替sha3
    // 2. keccak256只接受一个bytes类型的参数
    //   > 需要使用abi.encodePacked函数将输入的参数进行处理，
    //   > 如果有数字，需要明确转具体的类型，否则有warning
    
    bytes info = abi.encodePacked("hello", uint8(2), uint8(3), "xxxx");
    
    bytes32 public hash2 = keccak256(info);
    
}