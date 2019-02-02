pragma solidity ^0.5.2;

import "../interfaces/IRequestFulfillerRegistry.sol";
import "../interfaces/IFulfiller.sol";


contract Fulfiller is IFulfiller {
    bytes32 public requestType;

    constructor(bytes32 _requestType, address _registry) public {
        requestType = _requestType;
        IRequestFulfillerRegistry(_registry).addFulfiller(_requestType, address(this));
    }

    /**
     * @notice Get the name of the Module
     */
    function getType() public view returns(bytes32) {
        return requestType;
    }
}