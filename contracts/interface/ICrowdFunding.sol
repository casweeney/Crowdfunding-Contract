// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

interface ICrowdFunding {
    // struct Campaign {
    //     string title;
    //     uint target;
    //     uint amountReceived;
    // }

    struct Donor {
        bool donated;
        uint amountDonated;
    }

    function factory() external view returns(address);

    function createCampaign(string calldata _title, uint _target, uint _amountReceived) external;

    function donate(uint amount, uint campaign) external;
}