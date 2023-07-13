//
//  FeedbackView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI
import SafariServices

struct FeedbackView: View {
    
    @State var isShowingActivityView = false
    @State var urlToShow = ""
    @State var isShowingURL = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(actions) { action in
                    Button {
                        urlToShow = action.url
                        isShowingURL = true
                    } label: {
                        HStack {
                            Image(systemName: action.icon)
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text(action.name)
                                .font(.body)
                        }.padding(12)
                    }
                }.listStyle(.plain)
                    .frame(height: .infinity)
                
                Spacer()
                
                    .navigationTitle("Mas Acciones")
                    .navigationBarItems(trailing: Button(action: {
                        isShowingActivityView = true
                    }, label: {
                        Image(systemName: "square.and.arrow.up.fill")
                    }))
            }//Vstack
            .navigationBarTitle("Mas Acciones", displayMode: .inline)
            .sheet(isPresented: $isShowingActivityView, content: {
                ActivityView(activityItems: ["https://apps.apple.com/us/app/top-global-news/id6447653915se-world/id6447369429"])
            })
            .sheet(isPresented: $isShowingURL, content: {
                safari(urlString: $urlToShow)
            })
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}

struct safari : UIViewControllerRepresentable {
    
    @Binding var urlString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<safari>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: urlString)!)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<safari>) {
        
    }
}
