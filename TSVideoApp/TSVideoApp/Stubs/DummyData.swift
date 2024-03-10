//
//  DummyData.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import Foundation

// Load dummy data from JSON file
func loadDummyData() -> [VideoPost]? {
    guard let url = Bundle.main.url(forResource: "posts", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return nil
    }

    let decoder = JSONDecoder()
    do {
        let jsonData = try decoder.decode([String: [VideoPost]].self, from: data)
        return jsonData["data"]
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}

func loadDummyProfileData() -> ProfileData? {
    guard let url = Bundle.main.url(forResource: "profile", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return nil
    }

    let decoder = JSONDecoder()
    do {
        let jsonData = try decoder.decode([String: ProfileData].self, from: data)
        return jsonData["data"]
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}



 
