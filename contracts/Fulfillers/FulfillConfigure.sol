pragma solidity ^0.5.2;

import "./Fulfiller.sol";
import "../interfaces/IConfigureRequest.sol";
import "../interfaces/IFulfillTarget.sol";

contract FulfillConfigure is Fulfiller {
    address public fulfillTarget;

    constructor(address _fulfillTarget, address _registry) 
        public 
        Fulfiller("configure", _registry) {
            fulfillTarget = _fulfillTarget;
        }

    function fulfill(address _request) external returns (bool) {
        uint256[4] memory stoTimeArgs;
        uint256[4] memory stoInvestArgs;
        (stoTimeArgs, stoInvestArgs) = IConfigureRequest(_request).getDetails();
        IFulfillTarget(fulfillTarget).configure(stoTimeArgs, stoInvestArgs);
        return true;
    }
}