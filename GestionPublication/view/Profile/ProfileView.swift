import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter : EarthWiseFilterViewModel = .post
    @Environment(\.presentationMode) var mode
    @Namespace var animation


    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
             
            earthwiseFilterBar
            
            postsView
              
            
            
            
            
            Spacer()
        }
    }
}
 

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView : some View {
        ZStack(alignment: .bottomLeading){
            
            Color(.systemGreen)
                .ignoresSafeArea()
            
            
            VStack{
                Button{
                    mode.wrappedValue.dismiss()
                    
                }label: {
                    Image( systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y:12)
                }
            }
            Circle()
            
                .frame(width: 72, height: 72)
                .offset(x: 16 , y:24)
               
        }
        .frame(height: 96)
        
    }
    var actionButtons : some View {
         
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button{
                
            } label: {
                Text( " Edit Profile" )
                    .font(.subheadline).bold()
                    .frame(width: 120,height:32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth:0.75))
                
            }
        }
        .padding(.trailing)
        
    }
    var userInfoDetails : some View {
        VStack(alignment: .leading,spacing: 4){
            HStack{
                Text ( "Yesser Zagh" )
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemGreen))
                
                
                
            }
            Text("@yesserZagh")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            
            
            
            Text ("Develepment durable")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack(spacing: 4){
                    Text("807")
                        .font(.subheadline)
                        .bold()
                    Text("following")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                HStack(spacing: 4){
                    Text("6,9M")
                        .font(.subheadline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            }
            
        }
     
        
        
       
        .padding(.horizontal)
    }
    var earthwiseFilterBar : some View {
        HStack {
            ForEach(EarthWiseFilterViewModel.allCases, id: \.rawValue){ item in
                
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    if selectionFilter == item  {
                        Capsule()
                            .foregroundColor(Color(.systemGreen))
                            .frame(height: 3 )
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                        
                    }else {
                        Capsule()
                            .foregroundColor(Color( .clear))
                            .frame(height: 3 )
                        
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut)  {
                        self.selectionFilter = item
                    }
                    
               }
            }
        }
        .overlay(Divider().offset(x:0,y:16))
    }
    var postsView : some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9 , id : \ .self) { _ in
                    EarthWiseRowView()
                        .padding()
                    
                }
            }
        }
    }
}
