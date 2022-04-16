//
//  CardListViewModel.swift
//  Quizlet-ish
//
//  Created by Michelle Gantos on 4/11/22.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRespository()
    @Published var cardViewModels: [CardViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$cards.map { cards in
            cards.map(CardViewModel.init)
        }
        .assign(to: \.cardViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func add(_ card: Card) {
        cardRepository.add(card)
    }
}
