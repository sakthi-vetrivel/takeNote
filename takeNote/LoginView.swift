import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Login") {
                    // Implement your login logic here
                    isLoggedIn = true // For demonstration purposes
                }
                .padding()
                
                NavigationStack {
                    NavigationLink(value: isLoggedIn) {
                        EmptyView()
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        MainView()
                    }
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct MainView: View {
    var body: some View {
        // Your main app view here
        Text("Welcome to the main app!")
    }
}

// Preview
#Preview {
    LoginView()
}
