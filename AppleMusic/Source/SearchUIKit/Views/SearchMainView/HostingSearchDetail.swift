//
//  HostingSearchDetail.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 05.06.2022.
//

import SwiftUI
import UIKit

final class HostingSearchDetail: UIHostingController<SearchDetailContainer> {

    init(title: String) {
        super.init(rootView: SearchDetailContainer(title: title))
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
