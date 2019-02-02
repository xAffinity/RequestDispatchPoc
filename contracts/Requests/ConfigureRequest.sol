pragma solidity ^0.5.2;

import "./Request.sol";


contract ConfigureRequest is Request {
    uint256[4] public stoTimeArgs;
    uint256[4] public stoInvestmentArgs;

    constructor () public {
        factory = msg.sender;
        requestType = "configure";
    }

    function configure(uint256[4] memory _stoTimeArgs, uint256[4] memory _stoInvestmentArgs) public onlyFactory {
        stoTimeArgs = _stoTimeArgs;
        stoInvestmentArgs = _stoInvestmentArgs;
    }

    function getDetails() public view returns(uint256[4] memory, uint256[4] memory) {
        return (stoTimeArgs, stoInvestmentArgs);
    }

    function getInitFunction() public pure returns(bytes4) {
        return bytes4(keccak256("configure(uint256[4],uint256[4])"));
    }
}