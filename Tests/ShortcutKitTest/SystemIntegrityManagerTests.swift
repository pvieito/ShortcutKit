//
//  SystemIntegrityManagerTests.swift
//  SystemIntegrityKitTests
//
//  Created by Pedro José Pereira Vieito on 22/11/2019.
//  Copyright © 2019 Pedro José Pereira Vieito. All rights reserved.
//

import Foundation
import FoundationKit
import ShortcutKit
import XCTest

class ShortcutTests: XCTestCase {
    func testShortcut() throws {
        let shortcutURL = Bundle.currentModuleBundle().url(forResource: "TestShortcut", withExtension: "shortcut")!
        let shortcut = try Shortcut(contentsOf: shortcutURL)
        
        XCTAssertEqual(shortcut.icon?.glyphNumber, 59511)
        XCTAssertEqual(shortcut.actions.count, 6)
        XCTAssertEqual(shortcut.actions[0].identifier, "is.workflow.actions.sirikit.donation.handle")
        XCTAssertEqual(shortcut.types?.last, "WatchKit")
    }
}
