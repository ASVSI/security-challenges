// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DigitalSketchMarketplace is Ownable, ReentrancyGuard {
    struct Sketch {
        address artist;
        uint256 price; // in wei
        string ipfsHash; // off-chain file reference
        bool exists;
    }

    mapping(uint256 => Sketch) public sketches;
    uint256 public sketchCount;

    uint256 public platformFeePercent = 5; // 5%
    address payable public platformWallet;

    event SketchAdded(
        uint256 indexed id,
        address indexed artist,
        uint256 price,
        string ipfsHash
    );
    event SketchPurchased(
        uint256 indexed id,
        address indexed buyer,
        uint256 price
    );

    constructor(address payable _platformWallet) Ownable(msg.sender) {
        require(_platformWallet != address(0), "Invalid platform wallet");
        platformWallet = _platformWallet;
    }

    function addSketch(uint256 _price, string memory _ipfsHash) external {
        require(_price > 0, "Price must be > 0");
        require(bytes(_ipfsHash).length > 0, "IPFS hash required");

        sketchCount++;
        sketches[sketchCount] = Sketch(msg.sender, _price, _ipfsHash, true);

        emit SketchAdded(sketchCount, msg.sender, _price, _ipfsHash);
    }

    function purchaseSketch(uint256 _id) external payable nonReentrant {
        Sketch memory sketch = sketches[_id];
        require(sketch.exists, "Sketch does not exist");
        require(msg.value >= sketch.price, "Insufficient payment");

        uint256 platformFee = (msg.value * platformFeePercent) / 100;
        uint256 artistPayout = msg.value - platformFee;

        // Transfer funds
        (bool sentArtist, ) = payable(sketch.artist).call{value: artistPayout}("");
        require(sentArtist, "Artist payment failed");

        (bool sentPlatform, ) = platformWallet.call{value: platformFee}("");
        require(sentPlatform, "Platform fee transfer failed");

        emit SketchPurchased(_id, msg.sender, msg.value);
    }

    function setPlatformFee(uint256 _feePercent) external onlyOwner {
        require(_feePercent <= 20, "Fee too high");
        platformFeePercent = _feePercent;
    }

    function setPlatformWallet(address payable _wallet) external onlyOwner {
        require(_wallet != address(0), "Invalid wallet");
        platformWallet = _wallet;
    }
    function renounceOwnership() public pure override {
        revert("Renouncing ownership disabled");
    }
}
