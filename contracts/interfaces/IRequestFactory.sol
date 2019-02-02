pragma solidity ^0.5.2;

interface IRequestFactory {
    function deploy(bytes calldata _data) external returns(address);
    function getType() external view returns(bytes32);
}