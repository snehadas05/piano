import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_midi/flutter_midi.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:assets_audio_player/assets_audio_player.dart';

class BlackKey extends StatelessWidget {
  final String note;
  final int octave;
  const BlackKey(this.note, {super.key, required this.octave});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AssetsAudioPlayer.newPlayer().open(
            Audio("assets/piano notes/$note$octave.mp3"),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 25,
          height: 150,
          color: Colors.grey[900],
        ));
  }
}

class WhiteKey extends StatelessWidget {
  final String note;
  final int octave;
  const WhiteKey(this.note, {super.key, required this.octave});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AssetsAudioPlayer.newPlayer().open(
            Audio("assets/piano notes/$note$octave.mp3"),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 50,
          height: 270,
          color: Colors.white,
        ));
  }
}

class KeyBoard extends StatelessWidget {
  const KeyBoard({super.key});
  static const whiteKeys = ["C", "D", "E", "F", "G", "A", "B"];
  static const blackKeys = [
    "Db",
    "Eb",
    "Gb",
    "Ab",
    "Bb",
  ];
  static const allKeys = [
    "C",
    "Db",
    "D",
    "Eb",
    "E",
    "F",
    "Gb",
    "G",
    "Ab",
    "A",
    "Bb",
    "B",
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(children: [
        Row(children: [
          ...whiteKeys.map((k) => WhiteKey(k, octave: 3)),
          ...whiteKeys.map((k) => WhiteKey(k, octave: 4)),
        ]),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...allKeys.map((k) => k.contains("b")
              ? BlackKey(k, octave: 3)
              : const SizedBox(
                  width: 34,
                  height: 10,
                )),
          ...allKeys.map((k) => k.contains("b")
              ? BlackKey(k, octave: 4)
              : const SizedBox(
                  width: 33,
                  height: 10,
                )),
        ]),
      ]),
    );
  }
}
