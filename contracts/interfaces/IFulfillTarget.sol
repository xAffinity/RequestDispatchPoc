pragma solidity ^0.5.2;

interface IFulfillTarget {
    function configure(uint256[4] calldata _stoTimeArgs, uint256[4] calldata _stoInvestmentArgs) external;
}