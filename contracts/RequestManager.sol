pragma solidity ^0.5.2;

import "./interfaces/IRequestFactoryRegistry.sol";
import "./interfaces/IRequestFactory.sol";
import "./interfaces/IRequestFulfillerRegistry.sol";
import "./interfaces/IRequest.sol";
import "./interfaces/IFulfiller.sol";

contract RequestManager {
    address public requestFactoryRegistry;
    address public requestFulfillerRegistry;

    uint256 private count = 0;

    mapping(uint256 => address) requests;

    constructor (address _factoryRegistry, address _fulfillRegistry) public {
        requestFactoryRegistry = _factoryRegistry;
        requestFulfillerRegistry = _fulfillRegistry;
    }

    function getRequest(uint256 _requestID) public view returns (address) {
        return requests[_requestID];
    }

    function createRequest(bytes32 _requestType, bytes memory _data) public {
        address factory = IRequestFactoryRegistry(requestFactoryRegistry).getRequestFactory(_requestType);
        address request = IRequestFactory(factory).deploy(_data);
        requests[count] = request;
        count++;
    }

    function fulfillRequest(uint256 _requestID) public {
        address requestAddr = getRequest(_requestID);
        bytes32 requestType = IRequest(requestAddr).getType();
        address fulfiller = IRequestFulfillerRegistry(requestFulfillerRegistry).getRequestFulfiller(requestType);
        require(IFulfiller(fulfiller).fulfill(requestAddr));
    }
}