pragma solidity ^0.5.2;

library Util {
    function getSig(bytes memory _data) internal pure returns(bytes4 sig) {
        uint len = _data.length < 4 ? _data.length : 4;
        for (uint256 i = 0; i < len; i++) {
            sig |= bytes4(_data[i] & 0xFF) >> (i * 8);
        }
        return sig;
    }
}