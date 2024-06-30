//
//  EnterCodeScreen.swift
//  Wildberries
//
//  Created by Vladimir Murashka on 30.06.2024.
//

import SwiftUI

struct EnterCodeScreen: View {
    
    @FocusState private var oTPTextFieldFocusState : FocusOTPTextField?
    @State var firstDigit: String = ""
    @State var secondDigit: String = ""
    @State var thirdDigit: String = ""
    @State var fourthDigit: String = ""
    
    private let phoneNumber: String = "+7 (985) 433-33-13"
    private var secondsToRetryOTP: Int = 56
    
    var body: some View {
        ZStack {
            BackgroundView()
            MediumView() {
                VStack(spacing: 0) {
                    Image("envelope")
                        .padding([.top], 46.25)
                    Text(self.phoneNumber)
                        .frame(maxHeight: 29)
                        .font(Font.custom("Montserrat-Black", size: 24))
                        .foregroundStyle(.white)
                        .padding([.top], 22.25)
                        .padding([.bottom], 24)
                    self.OTPView
                        .frame(maxHeight: 80)
                        .padding([.top], 18)
                        .padding([.bottom], 30)
                    Text("Запросить повторно через \(self.secondsToRetryOTP) сек")
                        .font(Font.custom("Montserrat-Regular", size: 14))
                        .foregroundStyle(.white)
                        .padding([.top], 15)
                    CustomButton {
                        print("auth")
                    } content: {
                        Text("Авторизоваться")
                    }
                    .padding([.top], 24)
                    .padding([.bottom], 48)
                }
            }
            .frame(width: 400, height: 429)
        }
    }
    
    private var OTPView: some View {
        HStack(spacing:24, content: {
            TextField("", text: self.$firstDigit)
                .modifier(OTPTextFieldModifer(text:self.$firstDigit))
                .onChange(of:self.firstDigit) { value in
                    if (value.count == 1) {
                        self.oTPTextFieldFocusState = .second
                    }
                }
                .focused(self.$oTPTextFieldFocusState, equals: .first)
            TextField("", text:  $secondDigit)
                .modifier(OTPTextFieldModifer(text:$secondDigit))
                .onChange(of:secondDigit) { value in
                    if (value.count == 1) {
                        self.oTPTextFieldFocusState = .third
                    }else {
                        if (value.count == 0) {
                            self.oTPTextFieldFocusState = .first
                        }
                    }
                }
                .focused(self.$oTPTextFieldFocusState, equals: .second)
            TextField("", text:$thirdDigit)
                .modifier(OTPTextFieldModifer(text:$thirdDigit))
                .onChange(of:thirdDigit) { value in
                    if (value.count == 1) {
                        self.oTPTextFieldFocusState = .fourth
                    }else {
                        if (value.count == 0) {
                            self.oTPTextFieldFocusState = .second
                        }
                    }
                }
                .focused(self.$oTPTextFieldFocusState, equals: .third)
            TextField("", text:self.$fourthDigit)
                .modifier(OTPTextFieldModifer(text:$fourthDigit))
                .onChange(of:fourthDigit) { value in
                    if (value.count == 0) {
                        self.oTPTextFieldFocusState = .third
                    }
                }
                .focused(self.$oTPTextFieldFocusState, equals: .fourth)
        })
        .padding(.vertical)
    }
}

#Preview {
    EnterCodeScreen()
}


