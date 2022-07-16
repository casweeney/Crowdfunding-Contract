// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import './interface/ICrowdFunding.sol';

contract CrowdFunding is ICrowdFunding {

    address public immutable override factory;

    string public title;
    uint target;
    uint amountReceived;

    mapping(address => Donor) public donors;

    constructor(){factory = msg.sender;}

    function createCampaign(string calldata _title, uint _target) public override {
        title = _title;
        target = _target;
    }

    function donate(uint amount, uint campaign) public override {
        amountReceived += amount;
    }
}