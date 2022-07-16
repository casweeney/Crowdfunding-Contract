// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

interface ICrowdFunding {
    struct Donor {
        bool donated;
        uint amountDonated;
    }

    function factory() external view returns(address);

    function createCampaign(string calldata _title, uint _target) external;

    function donate(uint _amount) external;
}