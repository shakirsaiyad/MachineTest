

import Foundation

struct NoteList: Codable {
    let id: Int
    let address: String
    let avgRating, coverPicID: Int
    let welcomeDescription, headLine: String
    let suggestedAsAdvertisedHotspot, hotSpotUserStatus, noteForHotSpotLocation, isPublished: Bool
    let latitude, longitude: Double
    let postedDate: String
    let privacy: Int
    let shareable: Bool
    let updatedDate: String
    let regionID: Int
    let isDeletable, isEditable: Bool
    let notePoint: Double
    let tags: [Tag]
    let uploads: [CoverPic]
    let coverPic: CoverPic
    let userDetails: UserDetails
    let noteLike: [NoteLike]
    let weight: Double
    let favoriteStatus, status: Bool
    let commentsCount, count, userRating: Int
    let favoriteID: Int?
    let reported, hotspotRejected, published, deletable: Bool
    let editable: Bool
    let noteDate: String
    let hotSpot, isHotspotRejected: Bool
    let landMark: String

    enum CodingKeys: String, CodingKey {
        case id, address, avgRating
        case coverPicID = "coverPicId"
        case welcomeDescription = "description"
        case headLine, suggestedAsAdvertisedHotspot, hotSpotUserStatus, noteForHotSpotLocation, isPublished, latitude, longitude, postedDate, privacy, shareable, updatedDate
        case regionID = "regionId"
        case isDeletable, isEditable, notePoint, tags, uploads, coverPic, userDetails, noteLike, weight, favoriteStatus, status, commentsCount, count, userRating
        case favoriteID = "favoriteId"
        case reported, hotspotRejected, published, deletable, editable, noteDate, hotSpot, isHotspotRejected, landMark
    }
}

// MARK: - CoverPic
struct CoverPic: Codable {
    let id: Int
    let contentType: ContentType
    let createdDate: String
    let coverPicDescription: Description
    let fileName: String
    let fileSize: Int?
    let updatedDate: String
    let url: String
    let thumbnailURL: String?
    let orderNo, privacy: Int?

    enum CodingKeys: String, CodingKey {
        case id, contentType, createdDate
        case coverPicDescription = "description"
        case fileName, fileSize, updatedDate, url
        case thumbnailURL = "thumbnailUrl"
        case orderNo, privacy
    }
}

enum ContentType: String, Codable {
    case empty = ""
    case imagePNG = "image/png"
    case multipartFormData = "multipart/form-data"
    case videoMp4 = "video/mp4"
}

enum Description: String, Codable {
    case chandrikaDevi = "Chandrika Devi"
    case earlyMorningView = "Early Morning View"
    case empty = ""
    case entrances = "Entrances"
    case fullView = "Full View"
    case lordShiva = "Lord Shiva"
    case the20This20View20Is20JustE29C88EFB88F20Beautiful = "%20This%20view%20is%20just%E2%9C%88%EF%B8%8F%20beautiful"
}

// MARK: - NoteLike
struct NoteLike: Codable {
    let id: Int
    let userDetails: UserDetails
}

// MARK: - UserPreference
struct UserPreference: Codable {
    let id, friendID, userID: Int
    let friendPreference: UserDetails

    enum CodingKeys: String, CodingKey {
        case id
        case friendID = "friendId"
        case userID = "userId"
        case friendPreference
    }
}

// MARK: - UserDetails
struct UserDetails: Codable {
    let id: Int
    let aboutUs: String?
    let activationStatus, userActivationStatus: Bool
    let additionalDetails: AdditionalDetails?
    let createdDate, email: String
    let favCuisines: String?
    let friendsVisiblityStatus: Bool
    let gender: Gender?
    let googleID, interests, location: String?
    let mobile: Int?
    let name: String
    let uploadID: Int?
    let userType, userPrefrenceStatus, userPrivacy: Int
    let wifiOnly, notificationTone, vibration: Bool
    let userPoint: Int
    let regions: [Region]
    let upload, coverPic: CoverPic?
    let vistorStatus: Int
    let userFavTags: [Tag]
    let assignedTags: [JSONAny]
    let userPermissions: [UserPermission]
    let userFavDreamDestinations: [UserFavDreamDestination]
    let userShares: [JSONAny]
    let userPreferences: [UserPreference]
    let performance: Performance
    let totalFriends: Int
    let hasPassword, firstTimeRegistration: Bool
    let coverPicID: Int?
    let reported: Bool
    let deviceID: String
    let updatedDate, dob, fbID, appleID: String?
    let fcmDeviceID, deactivatedDate, regionType: String?
    let regionID: Int?

    enum CodingKeys: String, CodingKey {
        case id, aboutUs, activationStatus, userActivationStatus, additionalDetails, createdDate, email, favCuisines, friendsVisiblityStatus, gender
        case googleID = "googleId"
        case interests, location, mobile, name
        case uploadID = "uploadId"
        case userType, userPrefrenceStatus, userPrivacy, wifiOnly, notificationTone, vibration, userPoint, regions, upload, coverPic, vistorStatus, userFavTags, assignedTags, userPermissions, userFavDreamDestinations, userShares, userPreferences, performance, totalFriends, hasPassword, firstTimeRegistration
        case coverPicID = "coverPicId"
        case reported
        case deviceID = "deviceId"
        case updatedDate, dob
        case fbID = "fbId"
        case appleID = "appleId"
        case fcmDeviceID = "fcmDeviceId"
        case deactivatedDate, regionType
        case regionID = "regionId"
    }
}

enum AdditionalDetails: String, Codable {
    case additional20Info = "Additional%20Info"
    case birth2020Travel2020Die = "Birth%20-%20Travel%20-%20Die"
    case empty = ""
    case f09F988E = "%F0%9F%98%8E"
}

enum Gender: String, Codable {
    case empty = ""
    case female = "Female"
    case genderFemale = "female"
    case genderMale = "male"
    case male = "Male"
}

// MARK: - Performance
struct Performance: Codable {
}

// MARK: - Region
struct Region: Codable {
    let key: Key
    let approveStatus: ApproveStatus
    let regions: Regions
}

enum ApproveStatus: String, Codable {
    case approved = "APPROVED"
}

// MARK: - Key
struct Key: Codable {
    let userID, regionID: Int
    let appType: AppType

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case regionID = "regionId"
        case appType
    }
}

enum AppType: String, Codable {
    case goseeuserapp = "goseeuserapp"
}

// MARK: - Regions
struct Regions: Codable {
    let id: Int
    let country: Country
    let state: String
}

enum Country: String, Codable {
    case australia = "Australia"
    case india = "India"
    case united20States = "United%20States"
}

// MARK: - UserFavDreamDestination
struct UserFavDreamDestination: Codable {
    let id: Int
    let locations: String
    let locationType: Int
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}

// MARK: - UserPermission
struct UserPermission: Codable {
    let id: Int
    let address: String
    let userID, userType: Int

    enum CodingKeys: String, CodingKey {
        case id, address
        case userID = "userId"
        case userType
    }
}

typealias Welcome = [NoteList]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

