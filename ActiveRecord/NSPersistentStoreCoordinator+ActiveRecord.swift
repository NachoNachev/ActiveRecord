//
//  NSPersistentStoreCoordinator+ActiveRecord.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/08/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

private var defaultCoordinatorOpt: NSPersistentStoreCoordinator?
private var applicationDocumentsDirectory: NSURL = {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.bpnww.BPN" in the application's documents Application Support directory.
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
    return urls[urls.count-1] as NSURL
}()
private var defaultSqlitePersistentStoreNameOpt: String?
private var deleteStoreOnOpenFailure_ = false

extension NSPersistentStoreCoordinator {
    
    class var defaultPersistentStoreCoordinator: NSPersistentStoreCoordinator {
        get {
            if let coordinator = defaultCoordinatorOpt {
                return coordinator
            }
            defaultCoordinatorOpt = createDefaultStoreCoodrinator(alreadyDeletedStore: false)
            return defaultCoordinatorOpt!
        }
    }
    
    class var defaultSqlitePersistentStoreName: String {
        get {
            if let name = defaultSqlitePersistentStoreNameOpt {
                return name
            }
            if let infoDict = NSBundle.mainBundle().infoDictionary as? [String: AnyObject] {
                if let appName = infoDict[kCFBundleNameKey] as? String {
                    defaultSqlitePersistentStoreNameOpt = "\(appName).sqlite"
                }
            }
            if defaultSqlitePersistentStoreNameOpt == nil {
                defaultSqlitePersistentStoreNameOpt = "ActiveRecordStore.sqlite";
            }
            return defaultSqlitePersistentStoreNameOpt!
        }
        set {
            defaultSqlitePersistentStoreNameOpt = newValue
        }
    }
    
    class var deleteStoreOnOpenFailure: Bool {
        get {
            return deleteStoreOnOpenFailure_
        }
        set {
            deleteStoreOnOpenFailure_ = newValue
        }
    }
    
    private class func createDefaultStoreCoodrinator(#alreadyDeletedStore: Bool) -> NSPersistentStoreCoordinator {
        defaultCoordinatorOpt = NSPersistentStoreCoordinator(managedObjectModel: NSManagedObjectModel.defaultModel)
        let url = applicationDocumentsDirectory.URLByAppendingPathComponent(defaultSqlitePersistentStoreName)
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        let options = [NSMigratePersistentStoresAutomaticallyOption: NSNumber(bool: true),
            NSInferMappingModelAutomaticallyOption: NSNumber(bool: true)]
        if defaultCoordinatorOpt!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: options, error: &error) == nil {
            defaultCoordinatorOpt = nil
            // Report any error we got.
            if deleteStoreOnOpenFailure {
                NSLog("Deleting default sqlite store file: \(url.path)")
                var fileDeleteError: NSError? = nil
                if NSFileManager.defaultManager().removeItemAtURL(url, error: &fileDeleteError) {
                    return createDefaultStoreCoodrinator(alreadyDeletedStore: true)
                }
                NSLog("Fail to delete with error: \(fileDeleteError!)")
            }
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "ActiveRecordDomain", code: 666, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        return defaultCoordinatorOpt!
    }
    
}
