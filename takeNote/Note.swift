//
//  Note.swift
//  takeNote
//
//  Created by Sakthi Vetrivel on 8/20/24.
//

import Foundation
import SwiftData

@Model
final class Note: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var createdAt: Date
    
    init(id: UUID = UUID(), title: String, content: String, createdAt: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}

extension Note {
    static var mockData: [Note] {
        [
            Note(title: "Sakthi Vetrivel", content: "Met at the GSB, technical founder", createdAt: Date().addingTimeInterval(-1000000)),
            Note(title: "Karthik Vetrivel", content: "CS @ Stanford, NVIDIA engineer", createdAt: Date().addingTimeInterval(-200000)),
            Note(title: "Vetri Vellore", content: "CEO @ rhythms.ai Serial entrepreneur", createdAt: Date().addingTimeInterval(-30000)),
            Note(title: "Vetrivel", content: "CEO @ rhythms.ai Serial entrepreneur", createdAt: Date().addingTimeInterval(-30000)),
            Note(title:"Another contact", content: "Anotehr description", createdAt: Date())
        ]
    }
}
