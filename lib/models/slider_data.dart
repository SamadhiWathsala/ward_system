class SliderModel{

  String imagePath;

  SliderModel({this.imagePath});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }


  String getImageAssetPath(){
    return imagePath;
  }

}

List<SliderModel> getSlides(){

  List<SliderModel> slides = List<SliderModel>();
  SliderModel sliderModel = SliderModel();

  sliderModel.setImageAssetPath('images/nurse.png');
  slides.add(sliderModel);

  sliderModel.setImageAssetPath('images/nurse.png');
  slides.add(sliderModel);

  sliderModel.setImageAssetPath('images/nurse.png');
  slides.add(sliderModel);

  sliderModel.setImageAssetPath('images/nurse.png');
  slides.add(sliderModel);

  sliderModel.setImageAssetPath('images/nurse.png');
  slides.add(sliderModel);

  return slides;
}