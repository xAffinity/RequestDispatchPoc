pragma solidity ^0.5.2;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract RequestFulfillerRegistry is Ownable {
    mapping(bytes32 => address) public requestFulfillers;

    function addFulfiller(bytes32 _requestType, address _requestFulfiller) public onlyOwnerOrigin() returns(bool) {
        requestFulfillers[_requestType] = _requestFulfiller;
        return true;
    }

    function getRequestFulfiller(bytes32 _fulfillerType) public view returns(address) {
        return requestFulfillers[_fulfillerType];
    }

    modifier onlyOwnerOrigin() {
        require(tx.origin == owner());
        _;
    }
}