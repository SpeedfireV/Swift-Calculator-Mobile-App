//
//  ContentView.swift
//  Calculator Mobile App
//
//  Created by GregN on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
        HStack(spacing: 48) {
            Grid (horizontalSpacing: 16, verticalSpacing: 16){
                
                GridRow {
                    Button(action: {}) {
                        Text("1").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("2").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("3").font(.largeTitle).frame(width: .infinity)
                    }
                }.gridCellColumns(3)
                GridRow {
                    Button(action: {}) {
                        Text("4").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("5").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("6").font(.largeTitle).frame(width: .infinity)
                    }
                }.gridCellColumns(3)
                GridRow {
                    Button(action: {}) {
                        Text("7").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("8").font(.largeTitle).frame(width: .infinity)
                    }
                    Button(action: {}) {
                        Text("9").font(.largeTitle).frame(width: .infinity)
                    }
                }.gridCellColumns(3)
            }.frame(width: .infinity)
            VStack (spacing: 16){
                Text("X").font(.largeTitle).frame(width: .infinity)
                Text("-").font(.largeTitle).frame(width: .infinity)
                Text("+").font(.largeTitle).frame(width: .infinity)
                
            }
        }.frame(width: .infinity).padding()

    }
    
    
        
    
}

#Preview {
    ContentView()
}
