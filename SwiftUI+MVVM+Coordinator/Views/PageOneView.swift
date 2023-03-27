//
//  PageOneView.swift
//  SwiftUI+MVVM+Coordinator
//
//  Created by Татьяна Аникина on 22.03.2023.
//

import SwiftUI

struct PageOneView<VM: PageOneViewModelProtocol>: View {
    
    @ObservedObject var network = NetworkManager()
    
    @State var password = ""
    
    var viewmodel: VM
    
    func fetch() {
        network.fetchLatest()
        network.fetchFlash()
    }
    
    func productСategories(title: String, image: String) -> some View {
        Button {
            print("категории товаров")
        } label: {
            VStack {
                Image(image)
                
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .foregroundColor(Color.black)
                    .font(.custom("AvenirNext", size: 12))
            }
        }
    }
    
    func productImage(image: String, category: String, name: String, price: Int) -> some View {
        let data = ImageManager().getImageData(from: image)
               return Button {
                    print("категории товаров")
                } label: {
                    ZStack() {
                        if let imageData = data, let uiimage = UIImage(data: imageData) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .frame(width: 114, height: 149)
                        } else {
                            Image("")
                                .resizable()
                                .frame(width: 114, height: 149)
                                
                        }
                            
                            
                        VStack(alignment: .leading) {
                                Text(category)
                                    
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    
                                    .foregroundColor(Color.black)
                                    .font(.custom("AvenirNext", size: 10))
                                    .background(Color("LightGray"))
                                    .cornerRadius(12)
                                 
                                Text(name)
                                    .foregroundColor(Color.white)
                                    .font(.custom("AvenirNext", size: 12))
                                Text(String(price))
                                    .foregroundColor(Color.white)
                                    .font(.custom("AvenirNext", size: 12))
                               
                    }
                }
               
            }
     
    }
    
    func discountProductImage(imageProduct: String, category: String, name: String, price: Int, discount: Int) -> some View {
        let data = ImageManager().getImageData(from: imageProduct)
               return Button {
                    print("категории товаров")
                } label: {
                    ZStack() {
                        if let imageData = data, let uiimage = UIImage(data: imageData) {
                            Image(uiImage: uiimage)
                                .resizable()
                                .frame(width: 174, height: 221)
                        } else {
                            Image("")
                                .resizable()
                                .frame(width: 114, height: 149)
                                
                        }
                        
                        HStack(spacing: 85) {
                            Image("Icon")
                            
                            Text(String(discount) + "% off")
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .foregroundColor(Color.white)
                                .font(.custom("AvenirNext", size: 10))
                                .background(Color.red)
                                .cornerRadius(12)
                                
                    }
                    .offset(y: -80)
                            
                        VStack(alignment: .leading) {
                            Text(category)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .foregroundColor(Color.black)
                                .font(.custom("AvenirNext", size: 10))
                                .background(Color("LightGray"))
                                .cornerRadius(12)
                                 
                                Text(name)
                                    .foregroundColor(Color.white)
                                    .font(.custom("AvenirNext", size: 12))
                                Text(String(price))
                                    .foregroundColor(Color.white)
                                    .font(.custom("AvenirNext", size: 12))
                               
                    }
                }
               
            }
     
    }
    
    
    
        var body: some View {
            VStack {
                VStack {
                    VStack {
                        HStack(spacing: 55) {
                            HStack(spacing: 65) {
                                Button(action: {
                                    print("button pressed")
                                    
                                }) {
                                    Image("SideMenu")
                                    
                                }
                                Text("Trade by date")
                                    .font(.custom("AvenirNext-Bold", size: 22))
                            }
                            
                            
                            VStack {
                                Image("profileMini")
                                
                                
                                HStack(spacing: 10) {
                                    Text("Location")
                                        .font(.custom("AvenirNext", size: 12))
                                    Image("chevronsDown")
                                }
                            }
                        }
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
                            TextField("What are you looking for", text: self.$password)
                                .multilineTextAlignment(TextAlignment.center)
                                .font(.footnote)
                                .frame(width: 289, height: 29)
                                .background(Color("LightGray"))
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment: .center, spacing: 21) {
                            productСategories(title: "Phones", image: "phone")
                            productСategories(title: "Headphones", image: "pods")
                            productСategories(title: "Games", image: "game")
                            productСategories(title: "Cars", image: "car")
                            productСategories(title: "Furniture", image: "bed")
                            productСategories(title: "kids", image: "robot")
                              
                        }
                        .padding()
                        .padding(.vertical, 14)
                        
                        
                    }
                }
                VStack(spacing: 0){
                    HStack(spacing: 270) {
                        Text("Latest")
                        Text("View all")
                        .font(.custom("AvenirNext", size: 11))
                    }
                    
                
                ScrollView(.horizontal, showsIndicators: false) {
                 
                        HStack(spacing: 12) {
                            ForEach(network.latestManager) { product in
                                ZStack {
                                    productImage(image: product.imageUrl, category: product.category, name: product.name, price: product.price)
                                      
                                }
                            }
                        }
                    
                    
                    }
                    HStack(spacing: 12) {
                        ForEach(network.flash) { product in
                            ZStack {
                                discountProductImage(imageProduct: product.imageUrl, category: product.category, name: product.name, price: Int(product.price), discount: product.discount)
                                  
                            }
                        }
                    }
                }
            }
            .onAppear(perform: fetch)
        }
    }
        
  
    
    struct PageOneView_Previews: PreviewProvider {
        static var previews: some View {
            PageOneView(viewmodel: PageOneViewModel())
        }
    }

