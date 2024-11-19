//
//  AvatarPickerView.swift
//  Unnamed
//
//  Created by Абдулин Байэль on 19/11/24.
//

import SwiftUI
import PhotosUI

struct AvatarPickerView: View {
    @State private var selectedImage: UIImage? // Здесь будет сохранено изображение
    @State private var isPickerPresented = false // Контролирует показ PHPickerViewController
    
    var body: some View {
        VStack {
            // Показываем изображение, если оно выбрано
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle()) // Делаем аватар круглым
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // Рамка вокруг
                    .padding()
            } else {
                // Пустое место, если изображение не выбрано
                Circle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 150, height: 150)
            }

            // Кнопка для изменения аватара
            Button("Выбрать аватар") {
                isPickerPresented = true
            }
            .padding()
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(selectedImage: $selectedImage) // Показываем PHPickerViewController
        }
    }
}
