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
        toDoListApp storage toDo = toDolistApps[msg.sender];

        toDo.account = msg.sender;
        toDo.message = _message;
        toDo.completed = false;
        toDo.userId = idNumber;

        creators.push(msg.sender);
        message.push(_message);
        messageId.push(idNumber);

        emit toDoEvent(msg.sender, toDo.userId, _message, toDo.completed);
    }
}
