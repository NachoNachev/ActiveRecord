//
//  NSManagedObject+Finders.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/08/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

extension NSManagedObject {
    
    class func findAll() -> [NSManagedObject] {
        return findAllInContext(NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func findAllInContext(context: NSManagedObjectContext) -> [NSManagedObject] {
        return findAllWithPredicate(nil, inContext: context)
    }

    class func findAllByAttribute(attribute: String, withValue value: CVarArgType) -> [NSManagedObject] {
        return findAllByAttribute(attribute, withValue: value, inContext: NSManagedObjectContext.contextForCurrentThread)
    }

    class func findAllByAttribute(attribute: String, withValue value: CVarArgType, inContext context: NSManagedObjectContext) -> [NSManagedObject] {
        let predicate = self.predicateWithAttribute(attribute, withValue: value)
        return findAllWithPredicate(predicate, inContext: context)
    }
    
    class func findAllWithPredicate(predicate: NSPredicate?) -> [NSManagedObject] {
        return findAllWithPredicate(predicate, inContext: NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func findAllWithPredicate(predicate: NSPredicate?, inContext context: NSManagedObjectContext) -> [NSManagedObject] {
        
        let request = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate
        if let result = context.executeFetchRequest(request, error: nil) as? [NSManagedObject] {
            return result
        }
        return [NSManagedObject]()
    }
    
    class func findFirst() -> NSManagedObject? {
        return findFirstWithPredicate(nil, inContext: NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func findFirstInContext(context: NSManagedObjectContext) -> NSManagedObject? {
        return findFirstWithPredicate(nil, inContext: context)
    }
    
    class func findFirstByAttribute(attribute: String, withValue value: CVarArgType) -> NSManagedObject? {
        return findFirstByAttribute(attribute, withValue: value, inContext: NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func findFirstByAttribute(attribute: String, withValue value: CVarArgType, inContext context: NSManagedObjectContext) -> NSManagedObject? {
        let predicate = self.predicateWithAttribute(attribute, withValue: value)
        return findFirstWithPredicate(predicate, inContext: context)
    }

    class func findFirstWithPredicate(predicate: NSPredicate?) -> NSManagedObject? {
        return findFirstWithPredicate(predicate, inContext: NSManagedObjectContext.contextForCurrentThread)
    }
    
    class func findFirstWithPredicate(predicate: NSPredicate?, inContext context: NSManagedObjectContext) -> NSManagedObject? {
        let request = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate
        request.fetchLimit = 1
        if let result = context.executeFetchRequest(request, error: nil) as? [NSManagedObject] {
            return result.first
        }
        return nil
    }
    
    class func predicateWithAttribute(attribute: String, withValue value: CVarArgType) -> NSPredicate {
        return NSPredicate(format: "%K == %@", attribute, value)!
    }

}
