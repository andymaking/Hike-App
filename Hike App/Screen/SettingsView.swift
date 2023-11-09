//
//  SettingsView.swift
//  Hike App
//
//  Created by Andima Udoh on 31/10/2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    
    private let alternativeAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
    ]
    
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            
            Section{
                HStack(alignment: .center) {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack (spacing: -10) {
                         Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice").fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenLMedium,
                            .customGreenLDark
                        ], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                VStack(spacing: 8){
                    Text("Where can you find\nPerfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks better in photos but is even better once you are actually there. The hike that you hope to do again someday\nFind the best hike days in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots its time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenLMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//: END OF HEADER SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            
            Section(header: Text("Alternate Icons")) {
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (spacing: 12) {
                        ForEach(alternativeAppIcons.indices, id: \.self) { item in
                            Button(action: {
                                print("\(alternativeAppIcons[item])-Preview")
                                
                                UIApplication.shared.setAlternateIconName(alternativeAppIcons[item]){ error in
                                    if (error != nil){
                                        print("Failed request to update the app Icon:  \(String(describing: error?.localizedDescription))")
                                    }else {
                                        print("You have changed apps alternate app Icon to \(alternativeAppIcons[item])")
                                    }
                                }
                            }, label: {
                                Image("\(alternativeAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                        })
                        }
                    }
                }//: SCROLLVIEW
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }//: SECTION
            .listRowSeparator(.hidden)
            .padding(.bottom, 12)
            
            // MARK: - SECTION: ABOUT
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copywright @ all Rights Reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                //1. Basic Labeled Content
//                LabeledContent("Application", value: "Hike")
                
                //2. Advanced Labeled Content
                CustomListRowView(
                    rowLabel: "Application",
                    rowIcon: "apps.iphone",
                    rowContent: "Hike",
                    rowTintColor: .blue
                )
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowIcon: "info.circle",
                    rowContent: "iOs, iPadOs",
                    rowTintColor: .red
                )
                CustomListRowView(
                    rowLabel: "Technology",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                CustomListRowView(
                    rowLabel: "Version",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                CustomListRowView(
                    rowLabel: "Developer",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "John Doe",
                    rowTintColor: .mint
                )
                CustomListRowView(
                    rowLabel: "Designer",
                    rowIcon: "paintpalette",
                    rowContent: "Robert Peters",
                    rowTintColor: .pink
                )
                CustomListRowView(
                    rowLabel: "Website",
                    rowIcon: "globe",
                    rowLinkLabel: "Credo Academy",
                    rowLinkDestination: "https://credo.academy",
                    rowTintColor: .indigo
                )
                
            }
        }//: LIST
    }
}

#Preview {
    SettingsView()
}
