//
//  NSManagedObjectContext+ActiveRecord.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/08/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

private let kActiveRecordContextKey = "AktiveRecordContextKey"

extension NSManagedObjectContext {
    
    class var contextForCurrentThread: NSManagedObjectContext {
        if NSThread.isMainThread() {
            return mainThreadContext
        }
        let currentThreadDict = NSThread.currentThread().threadDictionary!
        if let context = currentThreadDict[kActiveRecordContextKey] as? NSManagedObjectContext {
            return context
        }
        let context = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        context.persistentStoreCoordinator = NSPersistentStoreCoordinator.defaultPersistentStoreCoordinator
        currentThreadDict[kActiveRecordContextKey] = context
        return context
    }
    
    class var mainThreadContext: NSManagedObjectContext {
        let mainThreadDict = NSThread.mainThread().threadDictionary!
        if let context = mainThreadDict[kActiveRecordContextKey] as? NSManagedObjectContext {
            return context
        }
        
        func createMainThreadContext() {
            let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            context.persistentStoreCoordinator = NSPersistentStoreCoordinator.defaultPersistentStoreCoordinator
            mainThreadDict[kActiveRecordContextKey] = context
        }
        
        if NSThread.isMainThread() {
            createMainThreadContext()
        }
        else {
            dispatch_sync(dispatch_get_main_queue(), createMainThreadContext)
        }
        return (mainThreadDict[kActiveRecordContextKey] as? NSManagedObjectContext)!
    }
    
    class func save(error: NSErrorPointer) -> Bool {
        return contextForCurrentThread.save(error)
    }
    
}
