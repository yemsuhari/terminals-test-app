import Foundation

// MARK: - Welcome
struct MainObject: Codable
{
    let city: [City]
}

// MARK: - City
struct City: Codable
{
    let id, name, code: String
    let cityID: Int
    let latitude, longitude, url, timeshift: String
    let requestEndTime: RequestEndTime
    let sfrequestEndTime: SfrequestEndTime
    let day2DayRequest, day2DaySFRequest, preorderRequest: String
    let freeStorageDays: String?
    let terminals: Terminals

    enum CodingKeys: String, CodingKey
    {
        case id, name, code, cityID, latitude, longitude, url, timeshift, requestEndTime, sfrequestEndTime
        case day2DayRequest = "day2dayRequest"
        case day2DaySFRequest = "day2daySFRequest"
        case preorderRequest, freeStorageDays, terminals
    }
}

enum RequestEndTime: String, Codable
{
    case the1700 = "17:00"
    case the2330 = "23:30"
    case the2359 = "23:59"
}

enum SfrequestEndTime: String, Codable
{
    case empty = "  :  "
    case the1700 = "17:00"
    case the1800 = "18:00"
}

// MARK: - Terminals
struct Terminals: Codable
{
    let terminal: [Terminal]
}

// MARK: - Terminal
struct Terminal: Codable
{
    let id, name, address, fullAddress: String
    let latitude, longitude: String
    let phones: [Phone]
    let storage: Bool
    let mail: Mail?
    let mainPhone: String?
    let isPVZ, isOffice, receiveCargo, giveoutCargo: Bool
    let maps: Maps
    let addressCode: AddressCode?
    let calcSchedule: CalcSchedule
    let terminalDefault: Bool
    let maxWeight: Int
    let maxLength, maxWidth, maxHeight, maxVolume: Double
    let maxShippingWeight: Int
    let maxShippingVolume: Double
    let worktables: Worktables

    enum CodingKeys: String, CodingKey
    {
        case id, name, address, fullAddress, latitude, longitude, phones, storage, mail, mainPhone, isPVZ, isOffice, receiveCargo, giveoutCargo, maps, addressCode, calcSchedule
        case terminalDefault = "default"
        case maxWeight, maxLength, maxWidth, maxHeight, maxVolume, maxShippingWeight, maxShippingVolume, worktables
    }
}

// MARK: - AddressCode
struct AddressCode: Codable
{
    let streetCode, placeCode: String?

    enum CodingKeys: String, CodingKey
    {
        case streetCode = "street_code"
        case placeCode = "place_code"
    }
}

// MARK: - CalcSchedule
struct CalcSchedule: Codable {
    let derival, arrival: String
}

enum Mail: String, Codable
{
    case pismoDellinRu = "pismo@dellin.ru"
}

// MARK: - Maps
struct Maps: Codable
{
    let width: [String: Width]?
}

// MARK: - Width
struct Width: Codable
{
    let height: [String: Height]
}

// MARK: - Height
struct Height: Codable
{
    let url: String
}

// MARK: - Phone
struct Phone: Codable
{
    let number: String
    let type: TypeEnum
    let comment: Comment
    let primary: Bool
}

enum Comment: String, Codable
{
    case empty = ""
    case доб4 = "доб. 4"
    case многоканальный = "многоканальный"
}

enum TypeEnum: String, Codable
{
    case городской = "городской"
}

// MARK: - Worktables
struct Worktables: Codable
{
    let worktable: [Worktable]
}

// MARK: - Worktable
struct Worktable: Codable
{
    let department: Department
    let monday, tuesday, wednesday, thursday: String
    let friday: String
    let saturday, sunday: Day
    let timetable: String
}

enum Department: String, Codable
{
    case доставкаГруза = "Доставка груза"
    case ответственноеХранение = "Ответственное хранение"
    case ответственноеХранениеПриёмИВыдачаГруза = "Ответственное хранение: приём и выдача груза"
    case офис = "Офис"
    case приёмГруза = "Приём груза"
    case приёмИВыдачаГруза = "Приём и выдача груза"
}

enum Day: String, Codable
{
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
