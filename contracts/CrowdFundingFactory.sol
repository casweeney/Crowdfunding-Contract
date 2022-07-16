// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import './CrowdFunding.sol';

contract CrowdFundingFactory {
    address[] public campaigns;

    function getAllCampaigns() external view returns (address[] memory) {
        return campaigns;
    }

    function campaignsCount() external view returns (uint) {
        return campaigns.length;
    }

    function createCampaign(string calldata _title, uint _target) 
    external returns(address campaign) 
    {
        bytes memory bytecode = type(CrowdFunding).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(block.timestamp));
        assembly{
            campaign := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        ICrowdFunding(campaign).createCampaign(_title, _target);
        campaigns.push(campaign);
    }
}