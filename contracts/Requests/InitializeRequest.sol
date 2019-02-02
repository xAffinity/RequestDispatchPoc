pragma solidity ^0.5.2;

import "./Request.sol";


contract InitializeRequest is Request {
    uint256 public rate;

    constructor () public {
        factory = msg.sender;
    }

    function configure(uint256 _rate) public onlyFactory {
        rate = _rate;
    }

    function getDetails() public view returns(uint256) {
        return rate;
    }

    function getInitFunction() public pure returns(bytes4) {
        return bytes4(keccak256("configure(uint256)"));
    }
}