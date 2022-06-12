// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 待办事项
contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    function updateText(uint _index, string calldata _text) external {
        Todo storage data = todos[_index];
        data.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool) {
        Todo memory data = todos[_index];
        return (data.text, data.completed);
    }

    function updateCompleted(uint _index) external {
        Todo storage data = todos[_index];
        data.completed = !data.completed;
    }
}
