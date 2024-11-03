extension NumberParsing on dynamic {
  String toFigure() {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc(Match match) => '${match[1]},';
    return this.replaceAllMapped(reg, mathFunc);
  }
}
