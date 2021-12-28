// SPDX-License-Identifier: SimPL-2.0
pragma solidity >=0.8.x <0.9.0;

import "./base/Base.sol";

contract Startup is Base
{
    enum Mode{
        NONE, ESG, NGO, DAO, COM
    }

    struct wallet {
        string name;
        address walletAddress;
    }

    struct Profile {
        string name;
        Mode mode;
        string[] hashtag;
        bytes logo;
        string mission;
        address tokenContract;
        wallet[] wallets;
        string overview;
        bool isValidate;
        address bountyFactoryAddress;
    }

    event created(string name,Profile startUp,address bountyContractAddress);

    mapping(string => bool) public startupNames;
    Profile[] public startups;

    constructor() Base()
    {
        _owner = msg.sender;
    }

    function newStartup(Profile memory p) public payable {
        require(msg.value >= 1e17, "your balance must more than 0.1 eth");
        require(_coinbase != address(0), "the address can not be the smart contract address");
        require(bytes(name).length != 0, "name can not be null");
        require(startups[p.name].isValidate,"startup name has been used");
        p.isValidate = true;
        address bountyFactoryAddress = new BountyFactory();
        p.bountyFactoryAddress = bountyFactoryAddress;
        startups[p.name] = p;
        emit created(p.name,p);
    }
}

contract BountyFactory
{
    modifier onlyManager {
        require(msg.sender == manager);
        _;
    }

    address[] public allBounties;

    struct Profile {
        string title;
        string typ;
        string[] hashtag;
        string contractEmail;
        string overview;
        string durationSecond;
        Payment[] Payments;
    }

    struct Payment {
        string token;
        uint256 value;
    }

    constructor() Base()
    {
        _owner = msg.sender;
    }

    function newBounty(Profile memory p) public onlyManager {
        address bountyAddress = new Bounty();
        allBounties.push(bountyAddress);
    }
}

contract Bounty
{
    mapping(address => address[]) BountySenders;
}
