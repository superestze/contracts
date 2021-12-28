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
    }

    event created(string name,Profile startUp);

    //public 属性自动生成同名get方法
    mapping(string => Profile) public startups;

    constructor() Base()
    {
        _owner = msg.sender;
    }

    function newStartup(Profile memory p) public payable {
        require(_coinbase != address(0), "the address can not be the smart contract address");
        require(bytes(name).length != 0, "name can not be null");
        //名称唯一
        require(!startups[p.name].isValidate,"startup name has been used");
        p.isValidate = true;
        startups[p.name] = p;
        emit created(p.name,p);
    }
}

