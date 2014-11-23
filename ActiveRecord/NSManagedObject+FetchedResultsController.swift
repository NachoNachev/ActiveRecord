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

    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, inContext context: NSManagedObjectContext) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }

    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortedBy: attribute, ascending: ascending, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate, sortedBy attribute: String, ascending: Bool, inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let sortDescriptors = [ NSSortDescriptor(key: attribute, ascending: ascending) ]
        return fetchedResultsControllerWithPredicate(nil, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor]) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor], sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor], sectionNameKeyPath: String, cacheName: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerWithDelegate(delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }
    
    class func fetchedResultsControllerWithDelegate(delegate: NSFetchedResultsControllerDelegate,  sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        return fetchedResultsControllerWithPredicate(nil, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
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
        return fetchedResultsControllerWithPredicate(predicate, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor]) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: nil, cacheName: nil)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: nil)
    }

    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        return fetchedResultsControllerByAttribute(attribute, withValue: value, delegate: delegate, sortDescriptors: sortDescriptors, inContext: NSManagedObjectContext.contextForCurrentThread, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }
    
    class func fetchedResultsControllerByAttribute(attribute: String, withValue value: CVarArgType, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let predicate = self.predicateWithAttribute(attribute, withValue: value)
        return fetchedResultsControllerWithPredicate(predicate, delegate: delegate, sortDescriptors: sortDescriptors, inContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
    }

    class func fetchedResultsControllerWithPredicate(predicate: NSPredicate?, delegate: NSFetchedResultsControllerDelegate, sortDescriptors: [NSSortDescriptor], inContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) -> NSFetchedResultsController {
        let request = NSFetchRequest(entityName: self.entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: cacheName)
        controller.delegate = delegate
        return controller
    }
    
}
