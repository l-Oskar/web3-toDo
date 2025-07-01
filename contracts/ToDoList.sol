// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract ToDoList {
    uint256 public _idUser;
    address public ownerOfContract;

    address[] public creators;
    string[] public message;
    uint256[] public messageId;

    struct ToDoListApp {
        address account;
        uint256 userId;
        string message;
        bool completed;
    }

    event toDoEvent(
        address indexed account,
        uint256 indexed userId,
        string message,
        bool completed
    );

    mapping(address => ToDoListApp) public toDoListApps;

    constructor() {
        ownerOfContract = msg.sender;
    }

    function inc() internal {
        _idUser++;
    }

    function createList(string calldata _message) external {
        inc();

        uint256 idNumber = _idUser;
        ToDoListApp storage toDo = toDoListApps[msg.sender];

        toDo.account = msg.sender;
        toDo.message = _message;
        toDo.completed = false;
        toDo.userId = idNumber;

        creators.push(msg.sender);
        message.push(_message);
        messageId.push(idNumber);

        emit toDoEvent(msg.sender, toDo.userId, _message, toDo.completed);
    }

    function getCreatorData(
        address _address
    ) public view returns (address, uint256, string memory, bool) {
        ToDoListApp memory userData = toDoListApps[_address];

        return (
            userData.account,
            userData.userId,
            userData.message,
            userData.completed
        );
    }

    function getAddress() external view returns (address[] memory) {
        return creators;
    }

    function getMessages() external view returns (string[] memory) {
        return message;
    }

    function toggleComplete(address _address) public {
        ToDoListApp storage userData = toDoListApps[_address];
        userData.completed = !userData.completed;
    }
}
