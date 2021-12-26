pragma solidity >=0.8.x <0.9.0;


contract Test {
    
    
    address account1 = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c; 
    
    
    // 获取地址余额
    function getAcc1Balance() public view returns(uint256) {
        return account1.balance;
    }
    
    //transfer如果转账失败，会抛出异常，建议使用
    // 合约内：想给谁转钱，就用谁的地址调用transfer函数
    // 支付人：合约
    function transfer1() public {
        //合约向account转1eth
        account1.transfer(1 * 10 ** 18);
    }
    
    //Send如果转账失败，不会抛出异常，而是返回false
    function send() public returns(bool) {
        bool res = account1.send(100 * 10 ** 18);
        return res;
    }
    
    function() payable {
        
    }
    
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }
} 