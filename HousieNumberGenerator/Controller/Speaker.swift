//
//  Speaker.swift
//  HousieNumberGenerator
//
//  Created by Arjit Agarwal on 03/07/21.
//

import AVFoundation

class Speaker: NSObject, AVSpeechSynthesizerDelegate {
    private var speechSynthesiser = AVSpeechSynthesizer()
    private var voice = AVSpeechSynthesisVoice(language: "en-US")
    private var doOnFinish: (() -> Void)? = nil
    
    override init() {
        super.init()
        speechSynthesiser.delegate = self
    }
    
    func speak(toSpeak: String, doOnFinish: @escaping () -> Void) {
        self.doOnFinish = doOnFinish
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: toSpeak)
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 4.0
        speechUtterance.voice = voice
        speechSynthesiser.speak(speechUtterance)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if doOnFinish != nil {
            doOnFinish!()
        }
    }
}
