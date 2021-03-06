@testable import CapExis
import XCTest

final class FastHashedStringTests: XCTestCase {
    func testInitAndPlaintextEquals() {
        let plaintexts: [String] = [
            "",                                 // empty plaintext
            " \t \n ",                          // blank plaintext
            "p",                                // short plaintext
            "plaintext",                         // medium plaintext
            "This plaintext is very long!",      // long plaintext
            "Amazing ✨ Fun 😄 Love ❤️"         // plaintext including emoji
        ]

        for plaintext in plaintexts {
            let alteredPlaintext = plaintext + String(randomWithLength: 3, allowedCharactersType: .alphaNumeric)
            let hashedString = try! FastHashedString(plaintext)

            XCTAssertTrue(try! hashedString.plaintextEquals(to: plaintext))
            XCTAssertFalse(try! hashedString.plaintextEquals(to: alteredPlaintext))
        }
    }
}
