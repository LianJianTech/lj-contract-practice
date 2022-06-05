// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 结构体
contract MyStruct {
    struct Car {
        address owner;
        string model;
        uint year;
    }

    Car[] public cars;

    function func1() external {
        Car memory toyota = Car(msg.sender, "Toyota", 1990);
        Car memory lambo = Car({
            owner: msg.sender,
            model: "Lambor",
            year: 2000
        });
        Car memory tesla;
        tesla.owner = msg.sender;
        tesla.model = "Tesla";
        tesla.year = 2010;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car(msg.sender, "Ferrari", 1998));
    }

    function getSize() external view returns (uint) {
        return cars.length;
    }

    function func2() external {
        // 整体拷贝赋值
        Car memory car0 = cars[0];
        car0.year = 1800;
        delete car0.owner;

        /// 类似指针引用
        Car storage car1 = cars[1];
        car1.year = 1700;
        delete car1.owner;
    }
}
