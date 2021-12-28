pragma solidity ^0.4.24;

contract CrowFundingFactory {

    // 状态变量：
    // 1. 所有的众筹合约：
    address[] allFundings;
    // 2. 我发起的合约:
    mapping(address => address[]) createorFundings;

    SupportFundingContract supportFundingCon;

    // 众筹平台管理员：
    address public platformManager;

    constructor() public {
        platformManager = msg.sender;

        //所有投资人参与的所有的合约的实例
        supportFundingCon = new SupportFundingContract();
    }
    //========================
    event createFundingEvent(string _projectName, uint256 _targetBalance, uint256 _supportBalance, uint256 _lastSeconds);
    //创建合约
    function createFunding(string _projectName, uint256 _targetBalance, uint256 _supportBalance, uint256 _lastSeconds) public {

        // msg.sender  == 0xca3....

        // 1. 项目方提供数据，创建一个CrowFunding的实例。
        address fundingAddress = new CrowFunding(_projectName, _targetBalance, _supportBalance, _lastSeconds, msg.sender, supportFundingCon);

        // 2. 将返回的合约地址添加到allFundings结构
        allFundings.push(fundingAddress);

        // 3. 将返回的合约地址添加到creatorFundings结构
        createorFundings[msg.sender].push(fundingAddress);

        emit createFundingEvent(_projectName, _targetBalance, _supportBalance, _lastSeconds);
    }

    //========================
    // 辅助函数
    function getAllFundings() public view returns (address[]) {
        return allFundings;
    }

    // 返回当前账户所创建的所有合约
    function getCreatorFundings() public view returns (address[]) {
        return createorFundings[msg.sender];
    }

    // 返回当前账户所参与的所有合约
    function getSupportorFundings() public view returns (address[]) {
        // return supportorFundings[msg.sender];
        return supportFundingCon.getFunding(msg.sender);
    }
}


contract SupportFundingContract {

    //  所有投资人参与的所有的合约
    mapping(address => address[]) supportorFundings;

    // _supportor参与了fundingAddress众筹
    function setFunding(address _supportor, address fundingAddress) public {
        supportorFundings[_supportor].push(fundingAddress);
    }

    // 返回_supportor所参与的所有合约
    function getFunding(address _supportor) public view returns (address[]) {
        return supportorFundings[_supportor];
    }
}

contract CrowFunding {


    // 项目相关：
    // 1. 项目名称
    string public projectName;

    // 2. 目标金额
    uint256 public targetBalance;

    // 3. 单笔支持金额
    uint256 public supportBalance;

    // 4. 结束时间
    uint256 public endTime;

    // 其他：
    // 1. 项目方
    address public manager;

    // 2. 投资人集合
    address[] supportors;

    SupportFundingContract supportFundingCon;

    // "大黄蜂", 10000, 200, 3600
    constructor(string _projectName,
        uint256 _targetBalance,
        uint256 _supportBalance,
        uint256 _lastSeconds,
        address _manager,
        SupportFundingContract _supportFundingCon
    // mapping(address=>address[]) storage _supportorFundings
    ) public {
        //工厂合约的地址
        // manager = msg.sender;

        manager = _manager;

        projectName = _projectName;
        targetBalance = _targetBalance;
        supportBalance = _supportBalance;

        // 终止时间 = 当前时间 + 持续时间
        endTime = block.timestamp + _lastSeconds;

        supportFundingCon = _supportFundingCon;
    }

    // 记录一个地址是否已经参与众筹了
    mapping(address => bool) supportExistMap;

    //参与众筹
    function support() public payable {
        // 1. 任何人都可以参与
        // 2. 每次参与时，必须转入固定金额（supportBalance）
        require(msg.value == supportBalance);

        // 3. 每个地址只能参与一次（可选）
        //method1 : for supportors; //
        //methdo2 : mapping
        require(supportExistMap[msg.sender] == false);

        // 4. 记录参与人地址
        supportors.push(msg.sender);

        // 如果投资了，就标识出来
        supportExistMap[msg.sender] = true;

        //参数1：参与者， 参数2：参与的合约
        supportFundingCon.setFunding(msg.sender, address(this));
    }

    // 众筹失败退款
    function tuikuan() public onlyManager {
        for (uint256 i = 0; i < supportors.length; i++) {
            supportors[i].transfer(supportBalance);
        }

        // delete supportors;
        // selfdestruct(msg.sender); //合约销毁，可选
    }


    struct Request {

        // 1. 花费目的：买电池
        string purpose;

        // 2. 花费金额：100wei
        uint256 cost;

        // 3. 卖家地址: 0x11111
        address seller;

        // 4. 赞成花费的票数：3/4 ， 超过半数赞成时，允许支出
        uint256 approveCount;

        // 5. 每个人只能投票一次，mapping结构
        mapping(address => bool) approvedMap;

        // 6. 这个请求的当前状态，(投票中，已完成)
        VoteStatus status;
    }

    // 这个请求的当前状态
    enum VoteStatus {
        Voting, //投票中
        Completed //已完成
    }

    // 项目方创建的所有花费请求集合
    Request[] public allRequests;

    function createRequest(string _purpose, uint256 _cost, address _seller) public onlyManager {
        // 1. 定义一个请求结构
        // 2. 一个项目方可以发起N多个花费请求，需要把请求收集起来

        Request memory req = Request({
        purpose : _purpose,
        cost : _cost,
        seller : _seller,
        approveCount : 0,
        status : VoteStatus.Voting
        });

        allRequests.push(req);
    }


    // 批准花费
    function approveRequest(uint256 _index) public {
        // 1. 仅投资者才可以进行投票
        // require(supportExistMap[msg.sender] == true);
        require(supportExistMap[msg.sender]);

        // 获取请求
        // 一定要使用storage类型，因为所有的投资者都要维护这个请求的数据
        Request storage req = allRequests[_index];

        // 2. 每个投资者仅可以投票一次, 未投过才可以继续执行
        // require(req.approvedMap[msg.sender] ==false)
        require(!req.approvedMap[msg.sender]);

        // 3. 投票方式为对某一个请求的approveCount++
        req.approveCount++;

        // 4. 将自己标识为已投票
        req.approvedMap[msg.sender] = true;
    }


    // 执行花费
    function finalizeRequest(uint256 _index) public onlyManager {
        Request storage req = allRequests[_index];

        // 1. 仅管理员可以调用
        // 2. 只有批准人数过半时
        require(req.approveCount * 2 > supportors.length);

        // 3. 向商家转账（合约里面钱永远不会直接转给管理员）
        req.seller.transfer(req.cost);

        // 3. 将请求状态修改为complete
        req.status = VoteStatus.Completed;
    }

    // 获取参与人数组
    function getSupportors() public view returns (address[]) {
        return supportors;
    }

    // 获取参与人数
    function getSupportorsCount() public view returns (uint256) {
        return supportors.length;
    }

    modifier onlyManager {
        require(msg.sender == manager);
        _;
    }

    // 获取合约余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    //距离众筹结束剩余时间
    function getLeftTime() public view returns (uint256) {
        return endTime - block.timestamp;
    }

    //返回花费请求的数量
    function getRequestCount() public view returns (uint256) {
        return allRequests.length;
    }

    //返回指定请求的详细信息
    function getRequestByIndex(uint256 index) public view returns (string, uint256, address, bool, uint256, uint256) {
        require(index < allRequests.length);

        Request storage req = allRequests[index];

        bool isVoted = req.approvedMap[msg.sender];
        return (req.purpose, req.cost, req.seller, isVoted, req.approveCount, uint(req.status));
    }

}
