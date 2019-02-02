pragma solidity ^0.5.2;

import "./RequestFactory.sol";
import "./InitializeRequest.sol";
import "../libraries/Util.sol";
import "../interfaces/IRequest.sol";

contract InitializeRequestFactory is RequestFactory {
    
    constructor (address _registry) public RequestFactory("initialize", _registry) {

    }

    function deploy(bytes calldata _data) external returns(address) {
        address initializeRequest = address(new InitializeRequest());
        require(Util.getSig(_data) == IRequest(initializeRequest).getInitFunction(), "Invalid data");
        bool success;
        (success, ) = initializeRequest.call(_data);
        require(success, "Unsuccessfull call");
        return initializeRequest;
    }
}