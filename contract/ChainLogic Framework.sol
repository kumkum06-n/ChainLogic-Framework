// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
    ChainLogic Framework
    A simple logic-execution contract demonstrating:
    - Task creation
    - Task completion
    - Fetching task list
*/

contract Project {

    struct Task {
        uint id;
        string description;
        bool isCompleted;
    }

    address public owner;
    uint public taskCounter;
    mapping(uint => Task) public tasks;

    constructor() {
        owner = msg.sender;
    }

    // Function 1: Create a new task
    function createTask(string calldata description) external {
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, description, false);
    }

    // Function 2: Mark a task as completed
    function completeTask(uint taskId) external {
        require(taskId > 0 && taskId <= taskCounter, "Invalid task ID");
        require(!tasks[taskId].isCompleted, "Task already completed");
        tasks[taskId].isCompleted = true;
    }

    // Function 3: Get task details
    function getTask(uint taskId) external view returns (Task memory) {
        require(taskId > 0 && taskId <= taskCounter, "Invalid task ID");
        return tasks[taskId];
    }
}

