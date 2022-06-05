//
//  Animation+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 31.05.2022.
//

import SwiftUI

extension Animation {
    static func openCloseCover() -> Animation {
        Animation.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)
    }
}
