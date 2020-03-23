//
//  Election.swift
//  Agora-iOS
//
//  Created by Hridik Punukollu on 23/03/20.
//  Copyright © 2020 Hridik Punukollu. All rights reserved.
//

import Foundation
import RealmSwift

class ElectionData: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var electionDescription: String = ""
    @objc dynamic var electionType: String = ""
//    @objc dynamic var candidates: [String] = [""]
    @objc dynamic var ballotVisibility: String = ""
    @objc dynamic var startingDate: Date = Date()
    @objc dynamic var endingDate: Date = Date()
    @objc dynamic var isInvite: Bool = false
    @objc dynamic var isRealTime: Bool = true
    @objc dynamic var votingAlgo: String = ""
    @objc dynamic var noVacancies: Int = 0
}
