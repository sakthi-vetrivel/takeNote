import SwiftUI
import SwiftData

struct NoteSheet: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @FocusState private var isNotesFocused: Bool

    @Binding var note: Note
    var isNewNote: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Headshot placeholder
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 120) // Large headshot size
                    .overlay(
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                    )
                    .padding(.top, 40)

                // Name field
                TextField("Name", text: $note.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .textContentType(.name)
                    .submitLabel(.next)
                    .onSubmit {
                        isNotesFocused = true
                    }

                // Description/Notes field
                TextEditor(text: $note.content)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .focused($isNotesFocused)
                    .textContentType(.none)
                    .frame(maxHeight: 200)
                
                Spacer()
            }
            .padding()
            .navigationTitle(isNewNote ? "New Contact" : "Edit Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        if !note.title.isEmpty && !note.content.isEmpty {
                            if isNewNote {
                                context.insert(note)
                            }
                            try? context.save()
                            dismiss()
                        }
                    }) {
                        Text("Save")
                            .bold()
                    }
                }

                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel")
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    NoteSheet(note: .constant(Note.mockData[0]), isNewNote: true)
}
