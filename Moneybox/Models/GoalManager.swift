//
//  GoalManager.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import Foundation

protocol GoalModelDelegate {
    
    func goalModelRecieved(_ goalModel: GoalModel)
}

class GoalManager {
    
    static let shared = GoalManager()
    private init() { }
    
    var delegate: GoalModelDelegate?
    private var goalModel: GoalModel?
    
    func getGoal() -> GoalModel? {
        return goalModel
    }
    
    func setGoal(_ goal: GoalModel) {
        goalModel = goal
        delegate?.goalModelRecieved(goal)
    }
    
//    var goalModel: GoalModel? {
//        get {
//            guard let data = try? Data(contentsOf: .savedGoal) else { return nil }
//            return (try? JSONDecoder().decode(GoalModel.self, from: data)) ?? nil
//        }
//        set {
//            try? JSONEncoder().encode(newValue).write(to: .savedGoal)
//            delegate?.goalModelRecieved(goalModel!)
//        }
//    }
}

extension URL {
    static var savedGoal: URL {
        let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let bundleID = Bundle.main.bundleIdentifier ?? "MoneyBox"
        let subDirectory = applicationSupport.appendingPathComponent(bundleID, isDirectory: true)
        try? FileManager.default.createDirectory(at: subDirectory, withIntermediateDirectories: true, attributes: nil)
        return subDirectory.appendingPathComponent("savedGoal.json")
    }
}
