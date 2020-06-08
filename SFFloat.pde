class SFFloat{
  //Declare variables
  float mainNum;
  int powerOfTen;
  
  SFFloat(float mainNumInitial, powerOfTenInitial){
    mainNum = mainNumInitial;
    powerOfTen = powerOfTenInitial;
  }
  
  //Method to add two SF numbers
  SFFloat addSFFloat(SFFloat addVal){
    if (addVal.getPower() > powerOfTen){
      while (addVal.getPower() > powerOfTen){
        addVal.setMainNum(addVal.getMainNum() * 10);
        addVal.setPower(addVal.getPower() - 1);
      }
    }
    else if (addVal.getPower < powerOfTen){
      while (addVal.getPower() < powerOfTen){
        mainNum *= 10;
        powerOfTen++;
      }
    }
  }
  
  int getPower(){
    return powerOfTen;
  }
  
  void setPower(int powerNew){
    powerOfTen = powerNew;
  }
  
  float getMainNum(){
    return mainNum;
  }
  
  void setMainNum(float mainNumNew){
    mainNum = mainNumNew;
  }
  
}
