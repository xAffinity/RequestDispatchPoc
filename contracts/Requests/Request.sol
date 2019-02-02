pragma solidity ^0.5.2;

import "../interfaces/IRequest.sol";

contract Request is IRequest {
    address public factory;
    bytes32 public requestType;

    modifier onlyFactory {
        require(msg.sender == factory);
        _;
    }

    function getType() public view returns (bytes32) {
        return requestType;
    }
}