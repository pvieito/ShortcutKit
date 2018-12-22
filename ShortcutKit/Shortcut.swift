//
//  Shortcut.swift
//  ShortcutKit
//
//  Created by Pedro José Pereira Vieito on 26/09/2018.
//  Copyright © 2018 Pedro José Pereira Vieito. All rights reserved.
//

import Foundation
import FoundationKit

public struct Shortcut: Codable {
    public struct ShortcutAction: Codable {
        public struct Parameters: Codable {
            
            // is.workflow.actions.useractivity.open
            internal let appBundleIdentifier: String?
            internal let userActivityData: Data?
            
            // is.workflow.actions.sirikit.donation.handle
            internal let intentData: Data?
            internal let showWhenRun: Bool?
            
            private enum CodingKeys: String, CodingKey {
                
                // is.workflow.actions.useractivity.open
                case appBundleIdentifier = "AppBundleIdentifier"
                case userActivityData = "UserActivityData"
                
                // is.workflow.actions.sirikit.donation.handle
                case intentData = "IntentData"
                case showWhenRun = "ShowWhenRun"
            }
        }
        
        public let identifier: String
        private let parameters: Parameters
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "WFWorkflowActionIdentifier"
            case parameters = "WFWorkflowActionParameters"
        }
    }
    
    public struct ShortcutIcon: Codable {
        public let startColor: Int
        public let glyphNumber: Int
        public let imageData: Data?
        
        private enum CodingKeys: String, CodingKey {
            case startColor = "WFWorkflowIconStartColor"
            case glyphNumber = "WFWorkflowIconGlyphNumber"
            case imageData = "WFWorkflowIconImageData"
        }
    }
    
    public let clientVersion: String
    public let clientRelease: String
    public let actions: [ShortcutAction]
    public let icon: ShortcutIcon
    public let types: [String]?
    public let inputContentItemClasses: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case clientVersion = "WFWorkflowClientVersion"
        case clientRelease = "WFWorkflowClientRelease"
        case actions = "WFWorkflowActions"
        case icon = "WFWorkflowIcon"
        case types = "WFWorkflowTypes"
        case inputContentItemClasses = "WFWorkflowInputContentItemClasses"
    }
}

extension Shortcut {
    
    public init(contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    internal init(data: Data) throws {
        let decoder = PropertyListDecoder()
        self = try decoder.decode(Shortcut.self, from: data)
    }
}
