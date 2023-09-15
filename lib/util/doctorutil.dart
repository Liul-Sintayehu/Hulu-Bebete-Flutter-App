class DoctorUtil{
    final String name;
    final double rate;

  DoctorUtil( this.name, this.rate);
  bool get isNull {
    return name == null && rate == null;
  }
}