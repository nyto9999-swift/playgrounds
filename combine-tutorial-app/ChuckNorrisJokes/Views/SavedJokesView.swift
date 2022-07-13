 

import SwiftUI
import ChuckNorrisJokesModel

struct SavedJokesView: View {
  
  @Environment(\.managedObjectContext) private var viewContext
  
  var body: some View {
    VStack {
      NavigationView {
        List {
          ForEach(jokes, id: \.self) { joke in
            Text(joke.value ?? "N/A")
          }
          .onDelete { indices in
            self.jokes.delete(at: indices, inViewContext: self.viewContext)
          }
        }
        .navigationBarTitle("Saved Jokes")
      }
    }
  }
    
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(
                          keyPath: \JokeManagedObject.value,
                          ascending: true
                     )],
    animation: .default
  ) private var jokes: FetchedResults<JokeManagedObject>
}

struct SavedJokesView_Previews: PreviewProvider {
  static var previews: some View {
    SavedJokesView()
  }
}
