//
//  NoteRow.swift
//  takeNote
//
//  Created by Sakthi Vetrivel on 8/20/24.
//

import SwiftUI
import SwiftData

struct NoteRow: View {
    let note: Note
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(note.title)
                    .font(.headline)
                Spacer()
                Image(systemName:"note.text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 30)
                    .foregroundColor(Color.blue)
                    .shadow(color: Color.gray,
                            radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                            x: 0,
                            y: 0)
                
            }
            .padding(.horizontal)
            .padding(.top)
            Text(note.content)
                .font(.body)
                .lineLimit(1)
                .padding(.bottom)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.8))
                .shadow(color: Color.gray,
                        radius:2)
        )
//        .padding()
    }
}
    

#Preview {
    NoteRow(note:Note(title: "Sakthi", content: "Super cool gal", createdAt: Date()))
    
}
