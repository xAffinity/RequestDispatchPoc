pragma solidity ^0.5.2;

import "../interfaces/IRequestFactory.sol";
import "../interfaces/IRequestFactoryRegistry.sol";

contract RequestFactory is IRequestFactory {
    bytes32 public requestType;

    constructor(bytes32 _requestType, address _registry) public {
        requestType = _requestType;
        IRequestFactoryRegistry(_registry).addFactory(_requestType, address(this));
    }
    /**
     * @notice Get the name of the Module
     */
    function getType() public view returns(bytes32) {
        return requestType;
    }
}