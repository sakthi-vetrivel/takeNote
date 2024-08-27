//
//  ContentView.swift
//  takeNote
//
//  Created by Sakthi Vetrivel on 8/20/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var notes = Note.mockData
    @State private var isShowingSheet = false
    @State private var selectedNote: Note = Note(title: "", content: "", createdAt: Date.now)
    @State private var isNewNote = true
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Note.title) var swiftDataNotes: [Note]
    
    var body: some View {
        GeometryReader { geo in
                VStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(
                            LinearGradient(gradient:
                                            Gradient(colors:[
                                                Color.purple,
                                                Color.pink
                                            ]), startPoint:.topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(height:geo.size.height/2)
                        .overlay(
                            RoundedRectangle(cornerRadius:  25.0)
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 200)
                                .overlay(
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Welcome to takeNote")
                                                .font(.system(size: 24, weight: .bold))
                                            Text("Your personal space for caputuring notes")
                                                .font(.subheadline)
                                            
                                        }
                                        Spacer()
                                        Image(systemName: "applepencil.and.scribble")                    .imageScale(.large)
                                            .font(.system(size:40))
                                    }
                                        .padding()
                                )
                                .padding()
                                .foregroundColor(.white)
                        )
                    List {
                        ForEach(swiftDataNotes) { note in
                            NoteRow(note: note)
                                .onTapGesture {
                                    selectedNote = note
                                    isNewNote = false
                                    isShowingSheet = true
                                }
                                .swipeActions {
                                    Button("Delete") {
                                        context.delete(note)
                                        
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
            
            .sheet(isPresented: $isShowingSheet) {
                NoteSheet(note: $selectedNote, isNewNote: isNewNote)
                    .presentationDetents([.fraction(0.7), .large])
            }
            
            .overlay {
                if swiftDataNotes.isEmpty {
                    ContentUnavailableView(
                        label: {
                            Label
                            {
                                Text("No contacts")
                            } icon: {
                                Image(
                                    systemName: "person.fill.xmark"
                                )
                                .foregroundColor(.purple)
                            }
                        }
                    )
                    .offset(y: geo.size.height/6)
                }
            }
            .overlay(
                HStack {
                    Spacer()
                    Button(action: {
                        selectedNote = Note(title: "", content: "", createdAt: Date.now)
                        isNewNote = true
                        isShowingSheet = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .font(.system(size: 40))
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.pink, radius: 15)
                    }
                }.padding(),
                alignment: .bottomTrailing
            )
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
