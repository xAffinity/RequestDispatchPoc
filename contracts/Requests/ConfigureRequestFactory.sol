pragma solidity ^0.5.2;

import "./RequestFactory.sol";
import "./ConfigureRequest.sol";
import "../libraries/Util.sol";
import "../interfaces/IRequest.sol";

contract ConfigureRequestFactory is RequestFactory {
    
    constructor (address _registry) public RequestFactory("configure", _registry) {

    }

    function deploy(bytes calldata _data) external returns(address) {
        address configureRequest = address(new ConfigureRequest());
        require(Util.getSig(_data) == IRequest(configureRequest).getInitFunction(), "Invalid data");
        bool success;
        (success, ) = configureRequest.call(_data);
        require(success, "Unsuccessfull call");
        return configureRequest;
    }
}