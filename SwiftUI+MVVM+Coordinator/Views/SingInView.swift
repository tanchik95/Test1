//
//  SingInView.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI
import CoreData

struct SingInView<VM: SingInViewModelProtocol & SingInFlowStateProtocol>: View {
    
    @StateObject var viewModel: VM
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func saveUser() {
        let user = UserData(context: managedObjectContext)
        user.firstname = firstName
        user.lastname = lastName
        user.email = email
        PersistenceController.shared.save()
        viewModel.toPageOneAction()
    }
    
    var body: some View {
        SingInFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack(spacing: 125)  {
            
            Text("Sing in")
                .font(.custom("AvenirNext-Bold", size: 36))
            
            
            VStack(spacing: 35) {
                
                TextField("First name", text: self.$firstName)
                    .multilineTextAlignment(TextAlignment.center)
                    .font(.footnote)
                
                    .frame(width: 289, height: 29)
                    .background(Color("AccentColor"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                TextField("Last name", text: self.$lastName)
                    .multilineTextAlignment(TextAlignment.center)
                    .font(.footnote)
                
                    .frame(width: 289, height: 29)
                    .background(Color("AccentColor"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                TextField("Email", text: self.$email)
                    .multilineTextAlignment(TextAlignment.center)
                    .font(.footnote)
                
                    .frame(width: 289, height: 29)
                    .background(Color("AccentColor"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Button {
                    saveUser()
                } label: {
                    Text("Sing in")
                        .frame(width: 289, height: 46)
                        .background(Color("GrayBlue"))
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(10)
                    
                }
                
                HStack(spacing: 5) {
                    Text("Already have an account?")
                    
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                        .foregroundColor(.gray)
                    
                    Button {
                        viewModel.firstAction()
                    } label: {
                        Text("Log in")
                            .font(.system(size: 13, weight: .regular, design: .monospaced))
                            .foregroundColor(Color.blue)
                        
                    }
                }
                .offset(x: -55, y: -30)
                
                VStack(spacing: 25) {
                    Button(action: {}) {
                        HStack(alignment: .center, spacing: 10.0) {
                            Image("Google")
                                .padding(.leading, 10.0)
                            Text("Sing in with Google")
                                .foregroundColor(.black)
                            
                        }
                    }
                    
                    Button(action: {}) {
                        HStack(alignment: .center, spacing: 10.0) {
                            Image("Apple")
                                .padding(.leading, 10.0)
                            Text("Sing in with Apple")
                                .foregroundColor(.black)
                            
                        }
                    }
                }
            }
            
            
            .offset(y: -77)
        }
    }
}
