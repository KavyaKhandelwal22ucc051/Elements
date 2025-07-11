//
//  HomeView.swift
//  Elements
//
//  Created by kavya khandelwal  on 24/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                VStack{
                    
                    NavigationLink{
                        Elements()
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(colors: [Color.blue,Color.black], startPoint: .top, endPoint: .bottom)
                            )
                            .frame(width: 350,height: 150)
                            .overlay{
                                Text("Periodic Tabel")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }.padding()
                    
                    
                    NavigationLink{
                        SBlockView()
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(colors: [Color.red,Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 350,height: 150)
                            .overlay{
                                Text("S Group Elements")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }.padding()
                    
                    
                    NavigationLink{
                        PBlockView()
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(colors: [Color.black,Color.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 350,height: 150)
                            .overlay{
                                Text("P Group Elements")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }.padding()
                    
                    NavigationLink{
                        DBlockView()
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(colors: [Color.yellow,Color.green], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 350,height: 150)
                            .overlay{
                                Text("D Group Elements")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }.padding()
                    
                    NavigationLink{
                        FBlockView()
                    }label: {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(colors: [Color.purple,Color.black], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 350,height: 150)
                            .overlay{
                                Text("F Group Elements")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            }
                    }.padding()
                    
                }
            }.navigationTitle("Elementum")
                .scrollIndicators(.hidden)
                
            
        }
    }
}

#Preview {
    HomeView()
}
