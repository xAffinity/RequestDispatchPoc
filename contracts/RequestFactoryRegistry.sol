pragma solidity ^0.5.2;

import "./interfaces/IRequestFactory.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract RequestFactoryRegistry is Ownable {
    mapping(bytes32 => address) public requestFactories;

    function addFactory(bytes32 _requestType, address _requestFactory) public onlyOwnerOrigin() returns(bool) {
        requestFactories[_requestType] = _requestFactory;
        return true;
    }

    function getRequestFactory(bytes32 _factoryType) public view returns(address) {
        return requestFactories[_factoryType];
    }

    modifier onlyOwnerOrigin() {
        require(tx.origin == owner());
        _;
    }
}