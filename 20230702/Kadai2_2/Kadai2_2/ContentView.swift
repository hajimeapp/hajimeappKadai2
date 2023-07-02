//
//  ContentView.swift
//  Kadai2_2
//
//  Created by SHIGE on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var textList = ["", ""]
    @State var resultNumber: Int?
    @State var statement = "Label"
    @State var operation = 0
    var body: some View {
        VStack{
            VStack {
                VStack {
                    ForEach(textList.indices, id: \.self) { index in
                        TextField("", text: $textList[index])
                        //.numberPadはUIKeyboardType列挙体のケース
                            .keyboardType(UIKeyboardType.numberPad)
                        //.roundedBorderはRoundedBorderTextFieldStyle構造体のタイププロパティ
                            .textFieldStyle(.roundedBorder)
                    }
                    //Pickerの色を動画のように青にする方法が見当たっていない
                    Picker("符号", selection: $operation) {
                        Text("+").tag(0)
                        Text("-").tag(1)
                        Text("×").tag(2)
                        Text("÷").tag(3)
                    }
                    .pickerStyle(.segmented)
                    Button {
                        calculate()
                    } label: {
                        Text("Button")
                            .padding(5.0)
                    }
                }
                .padding(.leading, 80)
                .padding(.trailing, 130)
                HStack {
                    if let resultNumber = resultNumber {
                        Text(String(resultNumber))
                            .padding(.leading, 15)
                    } else {
                        Text(statement)
                            .padding(.leading, 15)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
    }
    
    func calculate() {
        let upperNumber = Int(textList[0]) ?? 0
        let lowerNumber = Int(textList[1]) ?? 0
        if operation == 0 {
            resultNumber = upperNumber + lowerNumber
        } else if operation == 1 {
            resultNumber = upperNumber - lowerNumber
        } else if operation == 2 {
            resultNumber = upperNumber * lowerNumber
        } else {
            if lowerNumber == 0 {
                resultNumber = nil
                statement = "割る数には0以外を入力して下さい"
            } else {
                resultNumber = upperNumber / lowerNumber
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
