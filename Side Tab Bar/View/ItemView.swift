//
//  ItemView.swift
//  Side Tab Bar
//
//  Created by Maxim Macari on 25/10/2020.
//

import SwiftUI

//ItemView
struct ItemView: View {
    
    var item: Item
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 4, content: {
                        Text("\(item.title)")
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        HStack{
                            
                            
                            Text("\(item.cost)" + " €")
                                .font(.title)
                                .fontWeight(.heavy)
                                .zIndex(1)
                            
                            Spacer()
                        }
                       
                    })
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.white)
                    })
                }
                .padding([.horizontal, .top])
                .padding(.bottom, -15)
                
                Image(item.image)
                    .padding(-30)
                    .offset(y: 5)
                    .zIndex(-1)
                
            }
            //image and color have same name
            .background(Color(item.image)
                            .cornerRadius(32)
                            .clipShape(ItemCurve())
                            .padding(.bottom, 32))
            
            Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(item.image))
                    .clipShape(Circle())
            })
            .offset(y: -18)
        })
       
        
    }
}
