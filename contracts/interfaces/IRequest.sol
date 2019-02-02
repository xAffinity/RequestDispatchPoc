pragma solidity ^0.5.2;

interface IRequest {
    function getType() external view returns(bytes32);
    function getInitFunction() external pure returns(bytes4);
}