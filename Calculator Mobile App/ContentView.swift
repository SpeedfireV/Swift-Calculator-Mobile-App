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
                        TextField("", text: $current_calculation, selection: $text_selection).font(.largeTitle).accessibilityHint(Text("Enter Calculations Here"))
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
                        InputButton(action: {
                            current_calculation += "1"
                        }, text: "1")
                        InputButton(action: {
                            current_calculation += "2"
                        }, text: "2")
                        InputButton(action: {
                            current_calculation += "3"
                        }, text: "3")
                        InputButton(action: {
                            current_calculation += "x"
                        }, text: "X")
                    }.gridCellColumns(3)
                    GridRow {
                        InputButton(action: {
                            current_calculation += "4"
                        }, text: "4")
                        InputButton(action: {
                            current_calculation += "5"
                        }, text: "5")
                        InputButton(action: {
                            current_calculation += "6"
                        }, text: "6")
                        InputButton(action: {
                            current_calculation += "-"
                        }, text: "-")
                    }.gridCellColumns(3)
                    GridRow {
                        InputButton(action: {
                            current_calculation += "7"
                        }, text: "7")
                        InputButton(action: {
                            current_calculation += "8"
                        }, text: "8")
                        InputButton(action: {
                            current_calculation += "9"
                        }, text: "9")
                        InputButton(action: {
                            current_calculation += "+"
                        }, text: "+")
                    }.gridCellColumns(3)
                    GridRow {
                        InputButton(action: {
                            current_calculation += "."
                        }, text: ".")
                        InputButton(action: {
                            current_calculation += "0"
                        }, text: "0")
                        
                        InputButton(action: {
                            current_calculation = String(calculate_output_string())
                        }, text: "=", color: .orange)
                        
                        InputButton(action: {
                            current_calculation += "/"
                        }, text: "/")
                    }.gridCellColumns(3)
                }.frame(width: .infinity)
               
            }.frame(width: .infinity).padding()
        }

    }
    
    
    private struct InputButton: View {
        let action: () -> Void
        let text: String
        let color: Color?
        
        init(action: @escaping () -> Void, text: String, color: Color? = nil) {
            self.action = action
            self.text = text
            self.color = color
        }
        
        var body: some View {
            Button(action: action) {
                Text(text).font(.largeTitle).frame(width: .infinity).foregroundStyle(color ?? .accentColor)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
