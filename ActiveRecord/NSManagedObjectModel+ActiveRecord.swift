//
//  NSManagedObjectModel+ActiveRecord.swift
//  ActiveRecord
//
//  Created by Nacho Nachev on 11/08/14.
//  Copyright (c) 2014 Nacho Nachev. All rights reserved.
//

import CoreData

private var defaultModelOpt: NSManagedObjectModel?
private var defaultModelNameOpt: String?

extension NSManagedObjectModel {
    
    class var defaultModel: NSManagedObjectModel {
        get {
            if let model = defaultModelOpt {
                return model
            }
            let modelURL = NSBundle.mainBundle().URLForResource(defaultModelName, withExtension: "momd")!
            defaultModelOpt = NSManagedObjectModel(contentsOfURL: modelURL)
            return defaultModelOpt!
        }
        set {
            defaultModelOpt = newValue
        }
    }
    
    class var defaultModelName: String {
        get {
            if let name = defaultModelNameOpt {
                return name
            }
            if let infoDict = NSBundle.mainBundle().infoDictionary as? [String: AnyObject] {
                defaultModelNameOpt = infoDict[kCFBundleNameKey] as? String
            }
            if defaultModelNameOpt == nil {
                defaultModelNameOpt = "ActiveRecordModel";
            }
            return defaultModelNameOpt!
        }
        set {
            defaultModelNameOpt = newValue
        }
    }
    
}
