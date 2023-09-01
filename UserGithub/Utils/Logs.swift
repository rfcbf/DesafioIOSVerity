//
//  Logs.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

enum LogType: String {
    case ERROR = "Erro"
    case WARNING = "Warning"
    case INFO = "Info"
    case DEBUG = "Debug"
}

public class Logs {
    #if DEBUG
        private static let isDebug: Bool = true
    #else
        private static let isDebug: Bool = false
    #endif
    
    private static var appName: String {
        return "UserGithub"
    }
    
    ///Message Error
    public static func e(_ message: String) {
        print(message, type: LogType.ERROR)
    }
    
    ///Message Warning
    public static func w(_ message: String) {
        print(message, type: LogType.WARNING)
    }
    
    ///Message Info
    public static func i(_ message: String) {
        print(message, type: LogType.INFO)
    }
    
    ///Message Debug
    public static func d(_ message: String) {
        if !isDebug { return }
        print(message, type: LogType.DEBUG)
    }
    
    public static func d(_ error: Error) {
        if !isDebug { return }
        debugPrint("[\(appName)]\(LogType.DEBUG): \(error)")
    }
    
    private static func print(_ message: String, type: LogType) {
        debugPrint("[\(appName)]\(type.rawValue): \(message)")
    }
}
