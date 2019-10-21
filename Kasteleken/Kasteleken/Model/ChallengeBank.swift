//
//  ChallengeBank.swift
//  Kasteleken
//
//  Created by Syvert Andreas Eidjord on 17/09/2019.
//  Copyright © 2019 Eidjord Marketing. All rights reserved.
//

import Foundation

class ChallengeBank{
    
    var list = [Question]()
    
    
    init(){
        list.append(Question(text: NSLocalizedString("Den som er mest edru, ta en shot!", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar en slurk.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Gjør deres beste danse moves. Drikk 5 ganger hvis du nekter.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Ta den feteste gruppe-selfien og legg den ut på Instagram med #kasteleken.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Ingen challenge denne gangen, bare nyt livet og verdset hvor heldige dere er for å leve <3", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Spill en kjent sang og gjør dere klar til allsang. 5 slurker straff for dårlig innsats.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle må ta en slurk av drikken til høyre for seg", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle drikker ett glass vann, dere har nok godt for det!", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar en slurk.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Ahoy landkrabber, queue Kaptein Sabeltann.", comment:""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Gå i undertøy de neste 5 minuttene, eller ta 10 slurker.", comment: ""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar to slurker.", comment: ""), type: .challenge))
        //1.3
        list.append(Question(text: NSLocalizedString("Alle tar tre slurker.", comment: ""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar fire slurker.", comment: ""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar fem slurker.", comment: ""), type: .challenge))
        list.append(Question(text: NSLocalizedString("Alle tar to slurker.", comment: ""), type: .challenge))


        
        
    }
    
}

