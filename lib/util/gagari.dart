class GagariUtil{
    final String name;
    final double rate;

  GagariUtil( this.name, this.rate);
  bool get isNull {
    return name == null && rate == null;
  }
}