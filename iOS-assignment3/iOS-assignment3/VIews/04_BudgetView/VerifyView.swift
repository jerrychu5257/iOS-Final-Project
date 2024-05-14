//
//  VerifyView.swift
//  iOS-assignment3
//
//  Created by YUN on 10/5/2024.
//

import SwiftUI

struct VerifyView: View {
    @State private var selectedLocationIndex = 0
        @State private var selectedUniversityIndex = 0
        @State private var universitiesFiltered = universities[0].names
        @State private var image: Image? = nil
        @State private var showingImagePicker = false
        @State private var showingConfirmation = false
        
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            VStack(spacing: 20) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()  // Dismiss the view
                }) {
                    Image(systemName: "chevron.down.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(UIColor(red: 255/255, green: 233/255, blue: 191/255, alpha: 1)))
                        .padding()
                }
                Text("Just a few quick steps to prove you’re a student and start enjoying special offers tailored just for you.")
                    .padding()
                
                Button("Upload Student ID Photo") {
                    showingImagePicker = true
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $image)
                }
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Picker("Choose University Location", selection: $selectedLocationIndex) {
                    ForEach(0 ..< universities.count, id: \.self) { index in
                        Text(universities[index].location).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: selectedLocationIndex) { newIndex in
                    universitiesFiltered = universities[newIndex].names
                    selectedUniversityIndex = 0 // Reset university selection
                }

                Picker("Choose University Name", selection: $selectedUniversityIndex) {
                    ForEach(0 ..< universitiesFiltered.count, id: \.self) { index in
                        Text(universitiesFiltered[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                Spacer()
                Button("Verify") {
                    showingConfirmation = true // Set this to show the confirmation screen
               }
               .buttonStyle(.borderedProminent)
               .fullScreenCover(isPresented: $showingConfirmation) {
                   ConfirmationView() // Present the confirmation view as a full-screen cover
               }
            }
            .padding()
        }
    }

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true)
        }
    }
}

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Verification Sent!")
                .font(.title)
                .padding()
            Text("Thank you for submitting your information. We will notify you once the verification process is complete.")
                .multilineTextAlignment(.center)
                .padding()
            Button("OK") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}

#Preview {
    VerifyView()
}
