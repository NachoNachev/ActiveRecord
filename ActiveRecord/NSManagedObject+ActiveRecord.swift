//
//  NSManagedObject+ActiveRecord.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/08/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

extension NSManagedObject {
    
    class func create() -> NSManagedObject {
        return createInContext(NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func createInContext(context: NSManagedObjectContext) -> NSManagedObject {
        
        return NSEntityDescription.insertNewObjectForEntityForName(self.entityName, inManagedObjectContext: context) as NSManagedObject
    }
    
    func delete() {
        managedObjectContext?.deleteObject(self)
    }
    
    func save() -> Bool {
        return save(nil)
    }
    
    func save(error: NSErrorPointer) -> Bool {
        if let success = managedObjectContext?.save(error) {
            return success
        }
        return false
    }
    
    class var entityName: String {
        var className = NSStringFromClass(self)
        if let range = className.rangeOfString(".", options: .BackwardsSearch) {
            return className.substringFromIndex(range.startIndex.successor())
        }
        return className
    }
    
}
