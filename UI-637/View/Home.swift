//
//  Home.swift
//  UI-637
//
//  Created by nyannyan0328 on 2022/08/09.
//

import SwiftUI

struct Home: View {
    @State var currentTab : Tab = .home
    @State var currentIndex : Int = 0
    @Namespace var animation
    var body: some View {
        VStack{
            
            HeaderView()
            
            SearchView()
            
            (
            
                Text("Feautred").foregroundColor(.red) + Text(" Movie").foregroundColor(.orange)
            )
            .fontWeight(.bold)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            CustomCrousel(index: $currentIndex, items: movies,cardPadding : 150, id: \.id) { movie, cardSize in
                
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width,height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
            }
            .padding(.horizontal,-15)
            .padding(.vertical)
            
          
            
            TabBar()
            
            
        }
        .padding([.horizontal,.top],15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
            GeometryReader{proxy in
                 let size = proxy.size
                
                TabView(selection: $currentTab) {
                    
                    
                    ForEach(movies.indices,id:\.self){index in
                        
                        Image(movies[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                           
                        
                    }
                    
                }
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                
                    LinearGradient(colors: [
                        .clear,
                        Color("BGTop"),
                        Color("BGBottom")
                    
                    
                    ], startPoint: .top, endPoint: .bottom)
                      
                
            }
            .ignoresSafeArea()
          
        }
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                VStack(spacing:15){
                    
                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30,height: 30)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.3))
                    
                    
                    if currentTab == tab{
                        
                        Circle()
                            .fill(.white)
                         .frame(width: 6,height: 6)
                         .matchedGeometryEffect(id: "TAB", in: animation)
                         
                    }
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .center)
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    
                    withAnimation(.easeInOut){
                        
                        currentTab = tab
                    }
                }
                
                
                
            }
            .padding(.horizontal)
            .padding(.bottom)
             
            
            
            
        }
    }
    @ViewBuilder
    func SearchView()->some View{
     
        HStack{
            
            Image("Search")
                .renderingMode(.template)
                .resizable()
                 .frame(width: 30,height: 30)
            
            TextField("Search", text: .constant(""))
            
            Image(systemName: "mic")
                .font(.title)
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background{
         
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .fill(.ultraThickMaterial)
        }
        .padding(.top,10)
        
    }
    @ViewBuilder
    func HeaderView()->some View{
        
        HStack{
            
            VStack(alignment: .leading,spacing: 15) {
                
                
                (
                
                Text("Hello") + Text(" Nyan nyan")
                
                )
                .font(.title3).fontWeight(.semibold)
                
                Text("Book your favorite movie")
                    .foregroundColor(.gray)
                  .frame(maxWidth: .infinity,alignment: .leading)
                
                
            }
            
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fill)
             .frame(width: 50,height: 50)
             .clipShape(Circle())
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
