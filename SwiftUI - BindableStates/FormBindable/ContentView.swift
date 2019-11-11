import SwiftUI
import UIKit

struct ContentView: View {
  
  @State private var username = ""
  @State private var password = ""
  @State private var showPassword = false
  
  var body: some View {
    
    NavigationView {
      ScrollView {
        VStack {
          HStack{
            Text("Sign In")
              .textStyle(TitleStyle())
            Image(systemName: "dollarsign.circle")
              .font(.system(.title))
              .foregroundColor(Color.GreenColor)
          }
          TextField("enter user name", text: $username)
            .padding(.top)
            .frame(minWidth:0, maxWidth: .infinity)
          HStack {
            SecureField("enter password", text: $password)
              .padding(.top)
              .frame(minWidth:0, maxWidth: .infinity)
              .padding(.bottom)
            
            Button(action: {
              self.showPassword.toggle()
            }) {
              HStack {
                Image(systemName: "lock")
                  .imageScale(.large)
                  .rotationEffect(.degrees(showPassword ? 180 : 0))
                  .animation(.spring())
              }.padding()
            }
          }
          
          if showPassword {
            Text(password)
              .font(.footnote)
              .foregroundColor(.gray)
          }
          
          HStack{
            Button(action: {}) {
              Text("Sign In")
                .background(buttonColor)
                .foregroundColor(buttonTextColor)
            }.buttonStyle(SolidButtonStyle())
              
              .disabled(username.isEmpty || password.isEmpty)
              .frame(minWidth:0, maxWidth: .infinity)
              .frame(height:33)
              
              .padding()
              .foregroundColor(.white)
              .background(buttonColor)
              .cornerRadius(8)
          }
          if showPassword {
            ShowPasswordSecurityReminder<Text>()
          } else {
            ShowInfoBanner<Text>()
          }
          // or you have the option to use ViewBuilder.buildBlock() inline..
          /**
           ViewBuilder.buildBlock(
             showPassword == true ? ViewBuilder.buildEither(first: ShowPasswordSecurityReminder<Text>()) : ViewBuilder.buildEither(second: ShowInfoBanner<Text>())
           )
           */
          
          
          Spacer()
        }
        .font(Font.system(size: 20, design: .rounded))
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .navigationBarTitle(Text("Mobile Banking"))
        .padding()
      }
    }
  }
  
  var userNamePasswordEntered: Bool {
    return !password.isEmpty && !username.isEmpty
  }
  var buttonColor: Color {
    return userNamePasswordEntered ? .blue : Color(.lightGray)
  }
  var buttonTextColor: Color {
    userNamePasswordEntered ? .white: Color(.secondaryLabel)
  }
}

struct ShowPasswordSecurityReminder<Content: View>: View {
  var body: some View {
    VStack{
      HStack {
        Spacer()
        Image(systemName: "info.circle")
          .font(.system(.largeTitle))
          .foregroundColor(Color.BlueColor)
          .padding(.all)
        Text("Remember if you tap the lock button, keep you iPhone screen away from view of the creepy others!")
          .textStyle(MediumTitleStyle())
          .padding()
      }.background(Color.BannerColor)
        .cornerRadius(8)
        .padding(.top)
    }
  }
}

struct ShowInfoBanner<Content: View>: View {
  var body: some View {
    
    VStack{
      HStack {
        Spacer()
        Image(systemName: "info.circle")
          .font(.system(.largeTitle))
          .foregroundColor(Color.BlueColor)
          .padding(.all)
        Text("Did you know that you could maximize your savings by applying to our Premium Visa Card? Follow the Green banners for more...")
          .textStyle(MediumTitleStyle())
          .padding()
        
      }.background(Color.BannerColor)
        .cornerRadius(8)
        .padding(.top)
    }
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
