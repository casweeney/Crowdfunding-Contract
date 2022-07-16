// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./interface/ICrowdFunding.sol";

contract CrowdFunding is ICrowdFunding, Ownable {
    address public immutable override factory;

    string public title;
    uint target;
    uint amountReceived;

    struct campaignStruct {
        string title;
        uint target;
        uint amountReceived;
    }

    campaignStruct[] public campaignLits;

    mapping(address => Donor) public donors;

    constructor() {
        factory = msg.sender;
    }

    function createCampaign(string calldata _title, uint _target)
        public
        override
    {
        title = _title;
        target = _target;
    }

    function donate() public payable override {
        // make sure the amount is greater than 0
        require(msg.value > 0, "You must send some Ether");
        Donor storage spender = donors[msg.sender];
        spender.donated = true;
        spender.amountDonated += msg.value;
    }

    function withdraw() public onlyOwner {
        address _owner = owner();

        // We need to check if the campaign contract balance is equal to or greater than the target
        // Then we perform the % deduction here

        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    // Functions below makes this contract payable
    receive() external payable {}

    fallback() external payable {}
}
