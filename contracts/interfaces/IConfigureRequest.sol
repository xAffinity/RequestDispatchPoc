pragma solidity ^0.5.2;


interface IConfigureRequest {
    function getDetails() external view returns(uint256[4] memory, uint256[4] memory);
}