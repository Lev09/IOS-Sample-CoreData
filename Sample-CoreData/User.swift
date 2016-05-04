//
//  User.swift
//  HitList
//
//  Created by Lev on 5/4/16.
//  Copyright © 2016 Lev. All rights reserved.
//

import Foundation
import CoreData


@objc(User) class User: NSManagedObject {

    @NSManaged var username: String
    @NSManaged var password: String

}