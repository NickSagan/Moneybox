//
//  GoalManager.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit

protocol GoalModelDelegate {
    
    func goalModelRecieved(_ goalModel: GoalModel)
}

class GoalManager {
    
    static let shared = GoalManager()
    private init() { }
    var delegate: GoalModelDelegate?
    private let defaults = UserDefaults.standard
    
    func getGoal() -> GoalModel {
        return goalModel
    }
    
    func setGoal(_ goal: GoalModel) {
        goalModel = goal
        delegate?.goalModelRecieved(goal)
    }
    
    private var goalModel: GoalModel {
        get {
            let image = loadImageFromDiskWith(fileName: "goalImage") ?? UIImage(named: "piggy")!
            let name = defaults.string(forKey: "name") ?? "Добавьте цель"
            let price = defaults.integer(forKey: "price")
            let savings = defaults.integer(forKey: "savings")
            let income = defaults.integer(forKey: "income")
            
            let goal = GoalModel(name: name, photo: image, price: price, savings: savings, income: income)
            return goal
        }
        
        set {
            saveImage(imageName: "goalImage", image: newValue.photo)
            defaults.setValue(newValue.name, forKey: "name")
            defaults.setValue(newValue.price, forKey: "price")
            defaults.setValue(newValue.savings, forKey: "savings")
            defaults.setValue(newValue.income, forKey: "income")
        }
    }
    
    private func saveImage(imageName: String, image: UIImage) {
        
     guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }

        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }

        }

        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }

    private func loadImageFromDiskWith(fileName: String) -> UIImage? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image

        }

        return nil
    }
}
