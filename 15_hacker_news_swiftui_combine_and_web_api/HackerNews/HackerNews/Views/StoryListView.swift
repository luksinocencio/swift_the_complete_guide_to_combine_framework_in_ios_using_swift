import SwiftUI

struct StoryListView: View {
    
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    var body: some View {
        List(self.storyListVM.stories, id: \.id) { storyVM in
            NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                Text("\(storyVM.id)")
            }
        }.listStyle(.plain)
        
        .navigationTitle("Hacker News")
        .embedInNavigationView()
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
