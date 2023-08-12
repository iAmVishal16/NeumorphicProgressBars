//
//  ProgressView.swift
//  NeumorphicProgressBars
//
//  Created by Vishal Paliwal on 02/08/23.
//

import SwiftUI
import AVKit

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
            .preferredColorScheme(.dark)
    }
}

struct MusicPlayerView: View {
    
    @State private var angle = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State var formattedDuration: String = "00:00"
    @State var formattedProgress: String = "00:00"
    @State var audioPlayer: AVAudioPlayer!
    @State var progress: CGFloat = 0.0
    @State private var playing: Bool = false
    @State var duration: Double = 0.0

    var body: some View {
        
        ZStack {
            
            Color.offWhite
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                            .frame(width: 40, alignment: .center)

                        Image("arrow-left")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.gray)

                    }
                    
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                            .frame(width: 40, alignment: .center)

                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.gray)

                    }
                }
                .padding([.leading, .trailing], 24)
                
                Spacer()
            }
           
            ZStack {
                Image("dangerous")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .mask (
                        Circle()
                            .frame(width: 250, alignment: .center)
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

                
                Circle()
                    .stroke(lineWidth: 8)
                    .frame(width: 400, alignment: .center)
                    .opacity(0.2)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                    )
                
                Circle()
                    .stroke(lineWidth: 8)
                    .frame(width: 300, alignment: .center)
                    .opacity(0.2)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 4)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                    )
                
//                let percentage = progress * 100
//                Text(String(format: "%.0f", percentage) + "%")
//                    .font(.custom("Montserrat-Black", size: 40.0))
    //                .bold()
    //                .fontWeight(.black)
//                    .foregroundColor(.white.opacity(0.8))
                
                Circle()
                    .fill(
                        Material.ultraThinMaterial.opacity(0.5)
                    )
                    .frame(width: 150, alignment: .center)
                    .foregroundColor(.offWhite)

                Circle()
                    .frame(width: 30, alignment: .center)
                    .foregroundColor(.offWhite)


            }
            .overlay {
                
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(
                        LinearGradient(colors: [.mint, .mint.opacity(0.8), .mint.opacity(0.6), .mint.opacity(0.1)], startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .miter)
                    )
                    .frame(width: 350, alignment: .center)
                    .opacity(1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    .rotationEffect(.degrees(70))

            }
            .offset(x: 140)
            
            ZStack {
                
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    .frame(width: 60, alignment: .center)

                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.red)

            }
            .padding(.trailing, 32)
            .offset(x: 150, y: 260)
            
            ZStack {
                
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    .frame(width: 60, alignment: .center)

                Image(systemName: "shuffle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)

            }
            .padding(.trailing, 32)
            .offset(x: 60, y: 240)

            ZStack {
                
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    .frame(width: 60, alignment: .center)

                Image(systemName: "repeat.1")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)

            }
            .padding(.trailing, 32)
            .offset(x: -10, y: 190)
            
            ZStack {
                
                Circle()
                    .fill(Color.offWhite)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
                    .frame(width: 60, alignment: .center)

                Image(systemName: "music.note.list")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)

            }
            .padding(.trailing, 32)
            .offset(x: -70, y: 120)

        }
//        .overlay(alignment: .bottomTrailing, content: {
//            ZStack {
//
//                Circle()
//                    .fill(Color.offWhite)
//                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
//                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)
//                    .frame(width: 60, alignment: .center)
//
//                Image(systemName: "heart.fill")
//                    .resizable()
//                    .frame(width: 30, height: 30, alignment: .center)
//                    .foregroundColor(.red)
//
//            }
//            .padding(.trailing, 32)
//            .offset(y: -100)
//        })
        .overlay(alignment: .top , content: {
            VStack(alignment: .leading) {
                Text("Dangerous | Michael Jackson")
                    .font(.custom("Montserrat-Bold", size: 30.0))
                .foregroundColor(Color("TextColor").opacity(0.8))
                .lineSpacing(8)
                .padding(.bottom, 4)

                Text("Michael Jackson, The Cleveland Orchestra")
                    .font(.custom("Montserrat-Medium", size: 14.0))
                    .foregroundColor(Color("TextColor").opacity(0.6))
                
                Text("Vishal's Air Pods Pro")
                    .font(.custom("Montserrat-Light", size: 10.0))
                    .foregroundColor(Color.gray)
                    .padding(.top, 1)

            }
//            .padding()
            .padding(.top, 68)
            .padding(.leading, -50)
        })
        .overlay(alignment: .bottom ,content: {
            ZStack {
                Capsule()
                    .fill(Color.offWhite)
                    .frame(width: 220, height: 60)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 10, y: 10)

                HStack {
                    
                    Text(formattedProgress)
                        .font(.custom("Montserrat-Medium", size: 14.0).monospacedDigit())
                        .foregroundColor(Color("TextColor").opacity(0.8))
                    
                    Spacer()
                    
                    Button(action: {
                        let decrease = self.audioPlayer.currentTime - 15
                        if decrease < 0.0 {
                            self.audioPlayer.currentTime = 0.0
                        } else {
                            self.audioPlayer.currentTime -= 15
                        }
                    }) {
                        Image(systemName: "backward")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                            .foregroundColor(Color("TextColor").opacity(0.8))
                        .padding(.trailing, 16)
                    }
                    
                    Button(action: {
                        if audioPlayer.isPlaying {
                            playing = false
                            self.audioPlayer.pause()
                        } else if !audioPlayer.isPlaying {
                            playing = true
                            self.audioPlayer.play()
                        }
                    }) {
                        Image(systemName: playing ?
                              "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 30 ,height: 30)
                        .foregroundColor(Color("TextColor").opacity(0.8))
                    }
                    
                    Button(action: {
                        let increase = self.audioPlayer.currentTime + 15
                        if increase < self.audioPlayer.duration {
                            self.audioPlayer.currentTime = increase
                        } else {
                            self.audioPlayer.currentTime = duration
                        }
                    }) {
                        Image(systemName: "forward")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                            .foregroundColor(Color("TextColor").opacity(0.8))
                        .padding(.leading, 16)
                    }
                    
                    Spacer()
                    
                    Text(formattedDuration)
                        .font(.custom("Montserrat-Medium", size: 14.0).monospacedDigit())
                        .foregroundColor(Color("TextColor").opacity(0.8))

                }
            }
            .padding([.leading, .trailing], 32)

        })
//        .overlay(alignment: .bottomLeading ,content: {
//            Text(formattedProgress)
//                .font(.caption.monospacedDigit())
//                .foregroundColor(Color("TextColor").opacity(0.8))
//                .padding()
//        })
//        .overlay(alignment: .bottomTrailing ,content: {
//            Text(formattedDuration)
//                .font(.caption.monospacedDigit())
//                .foregroundColor(Color("TextColor").opacity(0.8))
//                .padding()
//        })
//        .onReceive(timer) { _ in
//            withAnimation(Animation.spring(response: 1, dampingFraction: 1, blendDuration: 1)) {
//                if angle > 1000 {
//                    angle = 0
//                }
//
//                angle += 1
//            }
//        }
        .onAppear {
            initialiseAudioPlayer()
        }
    }
    
    func initialiseAudioPlayer() {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [ .pad ]
        
        let path = Bundle.main.path(forResource: "MJDangerous",
                                    ofType: "mp3")!
        self.audioPlayer = try! AVAudioPlayer(contentsOf:
                                                URL(fileURLWithPath: path))
        self.audioPlayer.prepareToPlay()
        
        formattedDuration = formatter.string(from:
                                                TimeInterval(self.audioPlayer.duration))!
        duration = self.audioPlayer.duration
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true)
        { _ in
            if !audioPlayer.isPlaying {
                playing = false
            }
            progress = CGFloat(audioPlayer.currentTime /
                               audioPlayer.duration)
            formattedProgress = formatter
                .string(from:
                            TimeInterval(self.audioPlayer.currentTime))!
        }
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
