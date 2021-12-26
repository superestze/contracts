pragma solidity >=0.8.x <0.9.0;


contract Test {
    // 众筹场景：
    // \1. 每个人都可以参与，但是每人只能参与100wei
    // \2. 只要参与了，合约会记录这个人，已经参与的金额

    mapping(address => uint256) public personToMoney;
    
    function invest() public payable {
        
        if (msg.value != 10 ether) {
            throw;
            // return; //return 并不是执行失败，只是逻辑提前退出
        }
        
        personToMoney[msg.sender] = msg.value;
    }
    
    function getBalance() public view returns(uint256) {
        return this.balance;
    }
} 