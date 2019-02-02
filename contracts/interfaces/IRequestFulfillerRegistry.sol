pragma solidity ^0.5.2;

interface IRequestFulfillerRegistry {
    function addFulfiller(bytes32 _requestType, address _requestFulfiller) external returns(bool);
    function getRequestFulfiller(bytes32 _fulfillerType) external view returns(address);
}