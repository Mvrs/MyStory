//
//  ContextItem.swift
//  MyStory
//
//  Created by Marlon Johnson on 2/27/23.
//

import Foundation
import UIKit

class ContextItem {
    var role: String
    var location: String
    var funFact: String
    var photo: String

    init(role: String, location: String, funFact: String, photo: String) {
        self.role = role
        self.location = location
        self.funFact = funFact
        self.photo = photo
    }
}
