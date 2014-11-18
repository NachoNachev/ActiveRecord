//
//  NSManagedObject+FetchedResultsController.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/18/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

extension NSManagedObject {

    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }

    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, sectionNameKeyPath: String, cacheName: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }

    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let sortDescriptors = [ NSSortDescriptor(key: attribute, ascending: ascending) ]
        return fetchedResultsControllerWithPredicate(nil, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortedBy: sortAttribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: nil, cacheName: nil)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool, inContext context: NSManagedObjectContext) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortedBy: sortAttribute, ascending: ascending, inContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortedBy: sortAttribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }
    
    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortedBy: sortAttribute, ascending: ascending, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortedBy: sortAttribute, ascending: ascending, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortedBy sortAttribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let predicate = self.predicateWithAttribute(attribute, withValue: value)
        let sortDescriptors = [ NSSortDescriptor(key: sortAttribute, ascending: ascending) ]
        return fetchedResultsControllerWithPredicate(predicate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }

    class func fetchedResultsControllerWithPredicate(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let request = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }
    
}