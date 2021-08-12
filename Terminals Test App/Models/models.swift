//
//  models.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 02.08.2021.
//

import Foundation
import RealmSwift

// MARK: - MainObject
class MainObject: Object, Codable {
    @objc dynamic let city: [City]
}

// MARK: - City
class City: Object, Codable {
    @objc dynamic let terminals: Terminals // нужно
}


// MARK: - Terminals // нужно
class Terminals: Object, Codable {
    @objc dynamic let terminal: [Terminal]
}

// MARK: - Terminal
class Terminal: Object, Codable {
    @objc dynamic let name:String // нужно
    @objc dynamic let address:String  // нужно
    @objc dynamic let latitude:String // нужно
    @objc dynamic let longitude:String // нужно
    @objc dynamic let receiveCargo:Bool // нужно
    @objc dynamic let giveoutCargo:Bool // нужно
    @objc dynamic let maps: Maps // нужно
    @objc dynamic let `default`: Bool // нужно
    @objc dynamic let worktables: Worktables // нужно
}


// MARK: - Maps
class Maps: Object, Codable { // нужно
    @objc dynamic let width: [String: Width]?
}

// MARK: - Width
class Width: Object, Codable { //нужно
    @objc dynamic let height: [String: Height]
}

// MARK: - Height
class Height: Object, Codable { //нужно
    @objc dynamic let url: String
}


// MARK: - Worktables
class Worktables: Object, Codable { // нужно
    @objc dynamic let worktable: [Worktable]
}

// MARK: - Worktable
class Worktable: Object, Codable { // нужно
    @objc dynamic let department: Department
    @objc dynamic let monday, tuesday, wednesday, thursday: String
    @objc dynamic let friday: String
    @objc dynamic let saturday, sunday: Day
    @objc dynamic let timetable: String
}

enum Department: String, Codable { // нужно
    case доставкаГруза = "Доставка груза"
    case ответственноеХранение = "Ответственное хранение"
    case ответственноеХранениеПриёмИВыдачаГруза = "Ответственное хранение: приём и выдача груза"
    case офис = "Офис"
    case приёмГруза = "Приём груза"
    case приёмИВыдачаГруза = "Приём и выдача груза"
}

enum Day: String, Codable { // нужно
    case day11001600 = "11:00-16:00 "
    case empty = "-"
    case the00001600 = "00:00-16:00"
    case the08001600 = "08:00-16:00"
    case the08001700 = "08:00-17:00"
    case the08001800 = "08:00-18:00"
    case the08002000 = "08:00-20:00"
    case the09001300 = "09:00-13:00"
    case the09001400 = "09:00-14:00"
    case the09001500 = "09:00-15:00"
    case the09001600 = "09:00-16:00"
    case the09001700 = "09:00-17:00"
    case the09001800 = "09:00-18:00"
    case the09002000 = "09:00-20:00"
    case the09002100 = "09:00-21:00"
    case the10001400 = "10:00-14:00"
    case the10001500 = "10:00-15:00"
    case the10001600 = "10:00-16:00"
    case the10001700 = "10:00-17:00"
    case the10001800 = "10:00-18:00"
    case the10001900 = "10:00-19:00"
    case the10002000 = "10:00-20:00"
    case the10002100 = "10:00-21:00"
    case the11001600 = "11:00-16:00"
    case the11001930 = "11:00-19:30"
    case the21002100 = "21:00-21:00"
    case the24Ч = "24 ч"
}
