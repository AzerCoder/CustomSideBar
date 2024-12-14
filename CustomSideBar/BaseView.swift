//
//  BaseView.swift
//  CustomSideBar
//
//  Created by A'zamjon Abdumuxtorov on 13/12/24.
//

import SwiftUI

struct BaseView: View {
    @State private var showMenu = false
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab = 0
    
    @State var offset:CGFloat = 0
    @State var lastOffset:CGFloat = 0
    
    @GestureState var gestureOffset:CGFloat = 0
    
    var body: some View {
        
        let sidebarWidth = UIScreen.width - 90
        
        NavigationView{
            ZStack{
                VStack(spacing:0){
                    TabView(selection: $currentTab){
                        Home(showMenu: $showMenu)
                            .tag(0)
                        Text("Profile")
                            .tag(1)
                        Text("Settings")
                            .tag(2)
                        Text("Settings")
                            .tag(3)
                    }
                    .navigationBarHidden(true)
                   
                    
                    VStack(spacing:0) {
                        Divider()
                        HStack(spacing:0){
                            TabButton(image: "house", tab: 0)
                            TabButton(image: "magnifyingglass", tab: 1)
                            TabButton(image: "bell", tab: 2)
                            TabButton(image: "message", tab: 3)
                        }
                        .padding(.top)
                    }
                }
                .frame(width: UIScreen.width)
                .overlay {
                    Rectangle()
                        .fill(Color.primary)
                        .opacity(Double((offset/sidebarWidth)/5))
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                }
                
                SideMenu(showMenu: $showMenu)
                    .offset(x:-sidebarWidth)
                    .offset(x:offset > 0 ? offset : 0)
                    .gesture(
                        DragGesture()
                            .updating($gestureOffset, body: { value, out,_ in
                                out = value.translation.width
                            })
                            .onEnded(onEnd(value:))
                    )
                
            }
            .frame(width: UIScreen.width )
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out,_ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            .navigationBarHidden(true)
        }
        .animation(.easeInOut, value: offset == 0)
        .onChange(of: showMenu) { _, newValue in
            if showMenu && offset == 0{
                offset = sidebarWidth
                lastOffset = offset
            }
            
            if !showMenu && offset == sidebarWidth{
                offset = 0
                lastOffset = 0
            }
        }
        .onChange(of: gestureOffset) { _ ,value in
            onChange()
        }
        
    }
    
    func onChange(){
        let sidebarWidth = UIScreen.width - 90
        
        offset = (gestureOffset != 0 ) ? (gestureOffset + lastOffset < sidebarWidth ? gestureOffset + lastOffset : offset) : offset
    }
    
    func onEnd(value:DragGesture.Value){
        let sidebarWidth = UIScreen.width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            if translation > 0{
                
                if translation > (sidebarWidth/2){
                    offset = sidebarWidth
                    showMenu = true
                }else{
                    
                    if offset == sidebarWidth{
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            }else{
                
                if -translation > (sidebarWidth/2){
                    offset = 0
                    showMenu = false
                }else{
                    
                    if !showMenu && offset == 0{
                        return
                    }
                    
                    offset = sidebarWidth
                    showMenu = true
                }
            }
        }
        
        lastOffset = offset
    }
    
    @ViewBuilder
    func TabButton(image: String,tab:Int) -> some View {
        Button {
            withAnimation{currentTab = tab}
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23,height: 22)
                .foregroundColor(currentTab == tab ? .primary:.gray)
                .frame(maxWidth: .infinity)
        }

    }
}

#Preview {
    BaseView()
}
