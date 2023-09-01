//
//  Bool+Extension.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 29/08/23.
//

import Foundation

public extension Bool {
    var isFalse: Bool {
        return self == false
    }
}

public extension Optional where Wrapped == Bool {
    var isFalse: Bool {
        return self == false
    }

    var isTrue: Bool {
        return self == true
    }
}

public extension Optional {
    var isNotNil: Bool {
        return self != nil
    }

    var isNil: Bool {
        return self == nil
    }
}
