//
//  ProfileView.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selection: Tab = .schedule
    
    enum Tab: Int {
            case conversations, schedule, settings
        }
    
    
    
    @ViewBuilder
    func TabButtonImage(title: String, image: String) -> some View {
        Button {
            print("таблица")
        } label: {
            HStack {
                Image(image)
                    .renderingMode(.original)
                
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
            }
        }
    }
    
    func TabButtonImageAndChevron(title: String, image: String, imageRight: String) -> some View {
        Button {
            print("таблица")
        } label: {
            HStack {
                Image(image)
                    .renderingMode(.original)
               
                
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
                
                Image(imageRight)
                    .renderingMode(.original)
            }
        }
    }
    
    func TabButtonImageAndValue(title: String, image: String, value: String) -> some View {
        Button {
            print("таблица")
        } label: {
            HStack {
                
                Image(image)
                    .renderingMode(.original)
                
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
               
                    Text(value)
                        .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                        .foregroundColor(Color.black)
                
            }
        }
    }
    
    
    var body: some View {
        VStack{
            VStack{
                VStack(spacing: 19.6) {
                    VStack(spacing: 19.38) {
                        Text("Profile")
                            .font(.custom("AvenirNext-Bold", size: 21))
                           
                        VStack(spacing: 8.5) {
                            Image("profile")
                            Text("Change photo")
                             
                                .font(.custom("AvenirNext", size: 11))
                                .foregroundColor(Color("AccentGray"))
                        }
                    }
                    
                    Text("Santria Adhi Pradana")
                        .font(.custom("AvenirNext-Bold", size: 21))
                }
                
                Button(action: {
                          print("button pressed")

                        }) {
                            Image("Upload")
                                .renderingMode(.original)
                                .offset(x: -30)
                               
                            Text("Upload item")
                        }
                
                        .frame(width: 289, height: 46)
                        .background(Color("GrayBlue"))
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(10)
            }

            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 45) {
                    
                    TabButtonImageAndChevron(title: "Trade store", image: "Card", imageRight: "Chevron")
                    TabButtonImageAndChevron(title: "Payment method", image: "Card", imageRight: "Chevron")
                    TabButtonImageAndValue(title: "Balance", image: "Card", value: "$1593")
                    TabButtonImageAndChevron(title: "Trade history", image: "Card", imageRight: "Chevron")
                    TabButtonImageAndChevron(title: "Restore Purchase", image: "Restore", imageRight: "Chevron")
                    TabButtonImage(title: "Help", image: "Help")
                    TabButtonImage(title: "Log out", image: "LogOut")
                }
                .padding()
                .padding(.leading)
                .padding(.top, 35)
                
                
            }
        }
        
        
     }

    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
