//
//  Home.swift
//  Side Tab Bar
//
//  Created by Maxim Macari on 25/10/2020.
//

import SwiftUI

struct Home: View {
    
    @State var midY: CGFloat = 0
    @State var selectedTab = "Shakes"
    @State var search = ""
    
    var body: some View{
        
        HStack(spacing: 0){
            
            VStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                })
                
                Spacer(minLength: 0)
                
                ForEach(tabs, id: \.self){ tab in
                    ZStack{
                        
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 13, height: 13)
                            .offset(x: selectedTab == tab ? 28 : -80)
                        
                        Color.pink
                            .frame(width: 150, height: 110)
                            .rotationEffect(.init(degrees: -90))
                            .offset(x: -50)
                        
                        GeometryReader { geo in
                            Button(action: {
                                
                                withAnimation(.interactiveSpring(
                                    response: 0.6, dampingFraction: 0.65, blendDuration: 0.65
                                )){
                                    self.midY = geo.frame(in: .global).midY
                                    self.selectedTab = tab
                                }
                                
                            }, label: {
                                Text("\(tab)")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                            })
                            
                            .frame(width: 150, height: 110)
                            // default frame
                            .rotationEffect(.init(degrees: -90))
                            
                            //getting initial first curve position
                            .onAppear(){
                                if tab == tabs.first {
                                    self.midY = geo.frame(in: .global).midY
                                }
                            }
                            .offset(x: -8)
                        }
                        .frame(width: 150, height: 110)
                        
                    }
                }
                
                Spacer(minLength: 0)
            }
            .frame(width: 70)
            .background(
                Color.pink
                    .clipShape(Curve(midY: self.midY))
                    .ignoresSafeArea()
            )
            
            VStack{
                
                HStack{
                    VStack(alignment: .leading, spacing: 4, content: {
                        
                        HStack{
                            Text("Smoothie king")
                                .font(.title)
                                .fontWeight(.heavy)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "cart")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            })
                        }
                        
                        
                        Text("Shakes")
                            .font(.title)
                        
                    })
                    .foregroundColor(.black)
                    
                    
                }
                .padding(.horizontal)
                
                HStack(spacing: 15){
                    TextField("Search", text: $search)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    LazyVStack(spacing: 25){
                        
                        ForEach(items){ item in
                            
                            ItemView(item: item)
                            
                        }
                        
                    }
                    .padding()
                    .padding(.top)
                })
                
            }
            .padding(.leading)
            
            
            Spacer(minLength: 0)
        }
    }
}
