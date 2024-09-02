import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String kAppName = "Quotable";
const String homeLabel = "Home";
const String randomLabel = "Random";
const String categoriesLabel = "Categories";
const String bookMarkLabel = "BookMark";
const String authorsLabel = "Authors";
const String fontTxt = "Font";
const String themeTxt = "Theme";
const String shareAsText = "Share As Text";
const String shareAsPng = "Share As PNG";
const String saveAsPng = "Save As PNG";

const quoteBaseUrl = "https://api.quotable.io";
const quotesEndpoint = "/quotes";
const tagsEndpoint = "/tags";
const authorsEndpoint = "/authors";

TextStyle montserratFontStyle = GoogleFonts.montserrat();
TextStyle robotoMonoFontStyle = GoogleFonts.robotoMono();
TextStyle cairoFontStyle = GoogleFonts.cairo();
TextStyle robotoSlabFontStyle = GoogleFonts.robotoSlab();
TextStyle nerkoOneFontStyle = GoogleFonts.nerkoOne();
