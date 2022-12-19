//
//  RestAPIManager.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 16/12/22.
//

import UIKit
import Foundation

class RestAPIManager: NSObject {
    static let sharedInstance = RestAPIManager()
   
    func fetchNotes(completionHandler: @escaping ([NoteList]) -> Void) {
        let url = URL(string: "https://gosee.s3.amazonaws.com/notelist.json")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
            print("Error with the response, unexpected status code: \(response)")
            return
          }

          if let data = data,
            let arrTemp = try? JSONDecoder().decode([NoteList].self, from: data) {
            completionHandler(arrTemp)
          }
        })
        task.resume()
      }

    
    
}
