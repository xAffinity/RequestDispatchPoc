pragma solidity ^0.5.2;


interface IRequestFactoryRegistry {
    function getRequestFactory(bytes32 _factoryType) external view returns(address);
    function addFactory(bytes32 _requestType, address _requestFactory) external returns (bool);
}