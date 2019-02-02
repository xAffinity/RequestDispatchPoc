pragma solidity ^0.5.2;

contract FulfillTarget {
    uint256[4] public stoTimeArgs;
    uint256[4] public stoInvestmentArgs;
    uint256 public rate;

    function configure(uint256[4] memory _stoTimeArgs, uint256[4] memory _stoInvestmentArgs) public {
        stoTimeArgs = _stoTimeArgs;
        stoInvestmentArgs = _stoInvestmentArgs;
    }

    function initialize(uint256 _rate) public {
        rate = _rate;
    }

    function getDetails() public view returns (uint256[4] memory, uint256[4] memory, uint256) {
        return (stoTimeArgs, stoInvestmentArgs, rate);
    }
}