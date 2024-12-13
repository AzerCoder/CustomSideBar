//
//  SideMenu.swift
//  CustomSideBar
//
//  Created by A'zamjon Abdumuxtorov on 13/12/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu:Bool
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            VStack(alignment: .leading,spacing: 14) {
                Image(systemName: "person")
                    .resizable()
                    .padding()
                    .frame(width: 65,height: 65)
                    .background(.white)
                    .mask(Circle())
                
                Text("A'zamjon Abdumuxtorov")
                    .font(.title2.bold())
                Text("Software Engineer")
                    .font(.callout)
                
                HStack(spacing:12){
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("2323")
                                .bold()
                        }

                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("223")
                                .bold()
                        }

                    }
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
       
            ScrollView(showsIndicators: false){
                VStack {
                    VStack(alignment:.leading,spacing: 45){
                        TabButton(title: "Profile", image: "person")
                        TabButton(title: "Lists", image: "list.bullet.rectangle.portrait")
                        TabButton(title: "Topics", image: "list.bullet.circle")
                        TabButton(title: "Bookmarks", image: "bookmark")
                        TabButton(title: "Moments", image: "bolt")
                        TabButton(title: "Purchase", image: "cart")
                        TabButton(title: "Monitization", image: "person.text.rectangle")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top,35)
                    
                    Divider()
                    
                    TabButton(title: "Twitter Ads", image: "square.and.arrow.up")
                        .padding()
                        .padding(.leading)
                    Divider()
                    
                    VStack(alignment:.leading,spacing: 30){
                        Button("Settings Privacy"){
                            
                        }
                        Button("Settings Privacy"){
                            
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.primary)
                }
            }
            
            VStack(spacing:0){
                Divider()
                HStack{
                    Button {
                        
                    } label: {
                        Image(systemName: "lightbulb.max")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22,height: 22)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22,height: 22)
                    }

                }
                .padding([.horizontal,.top],15)
            }
            
           
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity,alignment: .leading)
        .frame(width: UIScreen.width - 90)
        .frame(maxHeight: .infinity)
        .background{
            Color.white
                .ignoresSafeArea(.container,edges: .vertical)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title:String,image:String)-> some View{
        NavigationLink {
            
        } label: {
            HStack(spacing:14){
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22,height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
            
        }

    }
}

#Preview {
    ContentView()
}

extension UIScreen{
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
}
