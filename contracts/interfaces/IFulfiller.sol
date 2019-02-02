pragma solidity ^0.5.2;

interface IFulfiller {
    function fulfill(address _request) external returns(bool);
    function getType() external view returns(bytes32);
}