//
//  ContentView.swift
//  Calculator Mobile App
//
//  Created by GregN on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var current_calculation: String = ""
    @State private var text_selection: TextSelection?
    func calculate_output_string() -> String {
        var final_output: Float = 0
        var math_operator: Character = "+"
        var current_number_string: String = ""
        for character: Character in current_calculation {
            if (48...57).contains(character.asciiValue!) || character == "."{
                current_number_string.append(character)
            } else {
                let current_number_float: Float = Float(current_number_string)!
                if math_operator == "+" {
                    final_output += current_number_float
                } else if math_operator == "x" {
                    final_output *= current_number_float
                } else if math_operator == "-" {
                    final_output -= current_number_float
                } else if math_operator == "/" {
                    final_output /= current_number_float
                }
                current_number_string = ""
                math_operator = character
                
            }
        }
        let current_number_float: Float = Float(current_number_string)!
        if math_operator == "+" {
            final_output += current_number_float
        } else if math_operator == "x" {
            final_output *= current_number_float
        } else if math_operator == "-" {
            final_output -= current_number_float
        } else if math_operator == "/" {
            final_output /= current_number_float
        }
        
        return String(String(final_output).prefix(12))
    }
    
    var body: some View {
            
        VStack {
                HStack {
                    ScrollView(.horizontal) {
                        TextField("", text: $current_calculation, selection: $text_selection)
                        TextField("Calculation", text: $current_calculation, prompt: Text("There is nothing here Yet!")).font(.largeTitle)
                    }
                    Spacer()
                    Button(action: {
                        current_calculation = String(current_calculation.dropLast())
                    }) {
                        Image(systemName: "delete.left")
                    }
                }.padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
           
            HStack(spacing: 48) {
                Grid (horizontalSpacing: 16, verticalSpacing: 16){
                    GridRow {
                        Button(action: {
                            current_calculation += "1"
                        }) {
                            Text("1").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "2"
                        }) {
                            Text("2").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "3"
                        }) {
                            Text("3").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "x"
                        }) {
                            Text("X")
                        }
                    }.gridCellColumns(3)
                    GridRow {
                        Button(action: {
                            current_calculation += "4"
                        }) {
                            Text("4").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "5"
                        }) {
                            Text("5").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "6"
                        }) {
                            Text("6").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "-"
                        }) {
                            Text("-")
                        }
                    }.gridCellColumns(3)
                    GridRow {
                        Button(action: {
                            current_calculation += "7"
                        }) {
                            Text("7").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "8"
                        }) {
                            Text("8").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "9"
                        }) {
                            Text("9").font(.largeTitle).frame(width: .infinity)
                        }
                        Button(action: {
                            current_calculation += "+"
                        }) {
                            Text("+")
                        }
                    }.gridCellColumns(3)
                    GridRow {
                        Button(action: {
                            current_calculation += "."
                        }) {
                            Text(".").font(.largeTitle).frame(width: .infinity)
                        }
                      
                        Button(action: {
                            current_calculation += "0"
                        }) {
                            Text("0").font(.largeTitle).frame(width: .infinity)
                        }
                        
                        Button(action: {
                            current_calculation = String(calculate_output_string())
                        }) {
                            Text("=")
                        }
                        Button(action: {
                            current_calculation += "/"
                        }) {
                            Text("/")
                        }
                    }.gridCellColumns(3)
                }.frame(width: .infinity)
               
            }.frame(width: .infinity).padding()
        }

    }
    
    
        
    
}

#Preview {
    ContentView()
}
