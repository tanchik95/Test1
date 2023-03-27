//
//  LoginView.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI
import CoreData

struct LoginView<VM: LoginViewModelProtocol & LoginFlowStateProtocol>: View {
    
    @StateObject var viewModel: VM
    @State var firstName = ""
    @State var password = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func checkUserData(firstName: String) -> Bool {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \UserData.firstname, ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "firstname == %@", firstName)
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return !results.isEmpty
        } catch {
            print("Error fetching user data: \(error.localizedDescription)")
            return false
        }
    }
    
    
    var body: some View {
        LoginCoordinator(state: viewModel, content: content)
    }
        @ViewBuilder private func content() -> some View {
            VStack{
                
                Text("Welcome back")
                    .font(.custom("AvenirNext", size: 36))
                    .padding(.bottom, 80)
                VStack(spacing: 35) {
                    
                    TextField("First name", text: self.$firstName)
                        .multilineTextAlignment(TextAlignment.center)
                    
                        .font(.footnote)
                        .frame(width: 289, height: 29)
                        .background(Color("AccentColor"))
                        .foregroundColor(Color("DarkGray"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
                        TextField("Password", text: self.$password)
                            .multilineTextAlignment(TextAlignment.center)
                            .font(.footnote)
                            .frame(width: 289, height: 29)
                            .background(Color("AccentColor"))
                            .foregroundColor(Color("DarkGray"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        Button(action: {
                            print("button pressed")
                            
                        }) {
                            Image("password")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .frame(width: 20, height: 20, alignment: .leading)
                            
                                .padding(7)
                        }
                    })
                }
                
                HStack {
                    Button {
                        checkUserData(firstName: self.firstName) ? viewModel.toPageOneAction() : print("error")
                    } label: {
                        Text("Login")
                            .frame(width: 289, height: 46)
                            .background(Color("GrayBlue"))
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.top, 99)
                        
                    }
                }
            }
        }
    }

