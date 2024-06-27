//
//  AuthViewModel.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String)async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch{
            print("failed to login \(error.localizedDescription)")
            alertMessage = "Login Failed\(error.localizedDescription)"
            showAlert = true
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }catch{
            print("Failed to create user \(error.localizedDescription)")
            alertMessage = "SignIn Failed\(error.localizedDescription)"
            showAlert = true
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch{
            print("failed to signOut\(error.localizedDescription)")
        }
        
    }
    
    func deleteAccount(){
        guard let currentUser = Auth.auth().currentUser else{ return }
        currentUser.delete{error in
            if let error =  error{
                print("error in deleting user\(error.localizedDescription)")
            }else{
                print("deleted")
            }
        }
        self.userSession = nil
        self.currentUser = nil
    }
    
    func fetchUser() async{
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else{ return }
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}
