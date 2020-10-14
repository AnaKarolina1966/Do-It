//
//  FilesConfig.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 28/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import Foundation

struct File {
    let name: String
    let ext: String
    
    var url : URL {
        let documentsURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent("\(name).\(ext)")
        return fileURL
    }
    
   
    func create(content: Data) {
        FileManager.default.createFile(atPath: self.url.relativePath, contents: content, attributes: nil)
        
    }
}
