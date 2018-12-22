//
//  main.swift
//  ShortcutTool
//
//  Created by Pedro José Pereira Vieito on 26/09/2018.
//  Copyright © 2018 Pedro José Pereira Vieito. All rights reserved.
//

import Foundation
import FoundationKit
import LoggerKit
import CommandLineKit
import ShortcutKit

let inputOption = MultiStringOption(shortFlag: "i", longFlag: "input", helpMessage: "Input shortcuts.")
let verboseOption = BoolOption(shortFlag: "v", longFlag: "verbose", helpMessage: "Verbose mode.")
let helpOption = BoolOption(shortFlag: "h", longFlag: "help", helpMessage: "Prints a help message.")

let cli = CommandLineKit.CommandLine()
cli.addOptions(inputOption, verboseOption, helpOption)

do {
    try cli.parse(strict: true)
}
catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if helpOption.value {
    cli.printUsage()
    exit(0)
}

Logger.logMode = .commandLine
Logger.logLevel = verboseOption.value ? .debug : .info

guard let inputItems = inputOption.value?.pathURLs, !inputItems.isEmpty else {
    Logger.log(error: "No input specified.")
    exit(EX_USAGE)
}

for inputItem in inputItems {
    do {
        let shortcut = try Shortcut(contentsOf: inputItem)
        
        Logger.log(important: inputItem.lastPathComponent)
        Logger.log(info: "Client Release: \(shortcut.clientRelease)")
        Logger.log(info: "Client Version: \(shortcut.clientVersion)")
        
        if let types = shortcut.types, !types.isEmpty {
            Logger.log(info: "Types: \(types.joined(separator: ", "))")
        }
        
        if let inputContentItemClasses = shortcut.inputContentItemClasses, !inputContentItemClasses.isEmpty {
            Logger.log(verbose: "Input Content Classes: \(inputContentItemClasses.joined(separator: ", "))")
        }
        
        Logger.log(success: "Actions (\(shortcut.actions.count))")
        
        for action in shortcut.actions {
            Logger.log(info: "\(action.identifier)")
        }
    }
    catch {
        Logger.log(warning: error)
    }
}
