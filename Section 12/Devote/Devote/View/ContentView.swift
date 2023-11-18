//
//  ContentView.swift
//  Devote
//
//  Created by 성준모 on 11/15/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: -  PROPERTY
    @State var task: String = ""
    // save저장 버튼을 눌렀을때 텍스트필드를 없애기 위해 사용하는 변수
    @FocusState private var nameIsFocused: Bool
    
    // 버튼 사용을 금지를 위해 제어하는 변수
    private var isButtonDisable: Bool {
        task.isEmpty
    }
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    
    // MARK: - FUNCTION
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    } //: ADDITEM
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    } //: DELETEBUTTON
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(spacing: 16){
                        TextField("New Task", text: $task)
                            .padding()
                            .background(
                                Color(UIColor.systemGray6)
                            )
                            .cornerRadius(10)
                            .focused($nameIsFocused)
                        
                        Button(action: {
                            addItem()
                            nameIsFocused = false
                        }, label: {
                            Spacer()
                            Text("Save")
                            Spacer()
                        })
                        .disabled(isButtonDisable)
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(
                            Color(isButtonDisable ? Color.gray : Color.pink)
                        )
                        .cornerRadius(10)
                        
                    } //: VSTACK
                    .padding(10)
                    
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading){
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    } //: LIST
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                } //: VSTACK
            } //: ZSTACK
            // iOS 16이상에서의 리스트 배경 지우는법
            .scrollContentBackground(.hidden)
            .navigationTitle("Daily Tasks")
            .toolbarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            } //: TOOLBAR
            .background(
                BackgroundImageView()
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
