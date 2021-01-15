class Replacer {
  static String replace(String yazi) {
    String sonuc;
    sonuc = yazi.replaceAll("\n", "");
    sonuc = sonuc.replaceAll("&Ccedil;", "Ç");
    sonuc = sonuc.replaceAll("&ccedil;", "ç");
    sonuc = sonuc.replaceAll("&#286;", "Ğ");
    sonuc = sonuc.replaceAll("&#287;", "ğ");
    sonuc = sonuc.replaceAll("&#304;", "İ");
    sonuc = sonuc.replaceAll("&#305;", "ı");
    sonuc = sonuc.replaceAll("&Ouml;", "Ö");
    sonuc = sonuc.replaceAll("&ouml;", "ö");
    sonuc = sonuc.replaceAll("&#350;", "Ş");
    sonuc = sonuc.replaceAll("&#351;", "ş");
    sonuc = sonuc.replaceAll("&Uuml;", "Ü");
    sonuc = sonuc.replaceAll("&uuml;", "ü");
    sonuc = sonuc.replaceAll("&nbsp;", " ");
    sonuc = sonuc.replaceAll("&#39;", "'");
    sonuc = sonuc.replaceAll("&rsquo;", "'");
    sonuc = sonuc.replaceAll("&lsquo;", "'");

    return sonuc;
  }
}
