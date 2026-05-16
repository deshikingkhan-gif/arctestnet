// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArcStream {
    struct Stream {
        address sender;
        address recipient;
        uint256 amount;
        uint256 startTime;
        uint256 stopTime;
        uint256 balance;
    }

    mapping(uint256 => Stream) public streams;
    uint256 public nextStreamId;

    event StreamCreated(uint256 indexed streamId, address indexed sender, address indexed recipient, uint256 amount);
    event StreamCanceled(uint256 indexed streamId);

    function createStream(address _recipient, uint256 _stopTime) external payable returns (uint256) {
        require(_recipient != address(0), "Invalid recipient");
        require(_stopTime > block.timestamp, "Stop time must be in future");
        require(msg.value > 0, "Amount must be greater than 0");

        uint256 streamId = nextStreamId++;
        streams[streamId] = Stream({
            sender: msg.sender,
            recipient: _recipient,
            amount: msg.value,
            startTime: block.timestamp,
            stopTime: _stopTime,
            balance: msg.value
        });

        emit StreamCreated(streamId, msg.sender, _recipient, msg.value);
        return streamId;
    }

    function cancelStream(uint256 _streamId) external {
        Stream storage stream = streams[_streamId];
        require(msg.sender == stream.sender || msg.sender == stream.recipient, "Not authorized");
        require(stream.balance > 0, "Stream already empty or finished");

        uint256 elapsedTime = block.timestamp - stream.startTime;
        uint256 totalDuration = stream.stopTime - stream.startTime;
        uint256 recipientShare = 0;

        if (block.timestamp >= stream.stopTime) {
            recipientShare = stream.balance;
        } else {
            recipientShare = (stream.amount * elapsedTime) / totalDuration;
        }

        uint256 senderShare = stream.balance - recipientShare;
        stream.balance = 0;

        if (recipientShare > 0) payable(stream.recipient).transfer(recipientShare);
        if (senderShare > 0) payable(stream.sender).transfer(senderShare);

        emit StreamCanceled(_streamId);
    }
}
