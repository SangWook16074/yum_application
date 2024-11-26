import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
    scaffoldBackgroundColor: const Color(0xffE8EEF2),
    useMaterial3: false,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xffFCD5C5),
          fontFamily: "PartialSansKR",
          fontSize: 64,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xff000000)),
        labelMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Pretendard",
          color: Color(0xffFFFFFF),
        ),
        labelSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Pretendard",
          color: Color(0xffA2A2A2),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Pretendard",
          color: Color(0xffFFFFFF),
        )),
    colorScheme: const ColorScheme.light(
        primary: Color(0xffF5713E),
        secondary: Color(0xffF89C78),
        onPrimaryContainer: Color(0xffffffff),
        onSecondaryContainer: Color(0xffd7d7d7),
        surfaceContainer: Color(0xff2A2A2A),
        tertiary: Color(0xffF3F3F3)));

ThemeData get dark => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xff000000),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xff272727),
          fontFamily: "PartialSansKR",
          fontSize: 64,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        labelMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Pretendard",
          color: Color(0xffFFFFFF),
        ),
        labelSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Pretendard",
          color: Color(0xffA2A2A2),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Pretendard",
          color: Color(0xffFFFFFF),
        )),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xffF5713E),
        secondary: Color(0xff272727),
        onPrimaryContainer: Color(0xff3A3A3A),
        onSecondaryContainer: Color(0xff686868),
        tertiary: Color(0xff272727)));
