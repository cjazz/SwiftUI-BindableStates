//
//  AppStyles.swift
//  BindableStatesAndComposables
//
//  Created by Adam Chin on 11/4/19.
//  Copyright © 2019 hushbox. All rights reserved.
//

import SwiftUI

struct BoardereButtondStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(minWidth: 44, minHeight: 44)
      .padding(.horizontal)
      .foregroundColor(Color.accentColor)
      .background(RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor))
  }
}

struct SolidButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(configuration.isPressed ? .gray : .GreenColor)
      .background(Color.accentColor)
      .cornerRadius(8)
  }
}

struct TitleStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size:24))
      .lineSpacing(8)
      .foregroundColor(Color.BlueColor)
  }
}
struct MediumTitleStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size:16))
      .lineSpacing(8)
      .foregroundColor(Color.BlueColor)
  }
}

struct ContentStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.body)
      .lineSpacing(4)
      .foregroundColor(.secondary)
  }
}

extension Text {
  func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
    ModifiedContent(content: self, modifier: style)
  }
}

extension Color {
  static let BlueColor = Color("BlueColor")
  static let BackgroundColor = Color("BackgroundColor")
  static let BannerColor = Color("BannerColor")
  static let GreenColor = Color("GreenColor")
  static let LightBlueColor = Color("LightBlueColor")
}

