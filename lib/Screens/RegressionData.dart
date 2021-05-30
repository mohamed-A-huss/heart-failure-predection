var predection;
Map patientData = {
  "age": 0,
  "anaemia": 0,
  "creatinine_phosphokinase": 0,
  "diabetes":0,
  "ejection_fraction": 0,
  "high_blood_pressure": 0,
  "platelets": 0,
  "serum_creatinine": 0.0,
  "serum_sodium": 0,
  "sex": 0,
  "smoking": 0,
  "time": 0
} ;
List<String> diagnosisNotes;
List<String> diagnosis (int ejection_fraction,int platelets,double serum_creatinine, int serum_sodium){
  List<String>diagnosis_list = [];
  if (ejection_fraction >= 50 && ejection_fraction <= 70){
  diagnosis_list.add('Your Ejection Fraction Level is In The Normal Range');}
    else if( ejection_fraction < 50){
  diagnosis_list.add('Your Ejection Fraction Level is Below The Normal Range');}
  else {
    diagnosis_list.add(
        'Your Ejection Fraction Level is Above The Normal Range');
  }
  if (platelets >= 140000 && platelets <= 450000){
  diagnosis_list.add('Your Platelets Level is In The Normal Range');}
  else if (platelets < 140000) {
    diagnosis_list.add('Your Platelets Level is Below The Normal Range');
  }else {
    diagnosis_list.add('Your Platelets Level is Above The Normal Range');
  }
  if (serum_creatinine >= 0.6 && serum_creatinine <= 1.4){
  diagnosis_list.add('Your Serum Creatinine Level is In The Normal Range');}
  else if( serum_creatinine < 0.6){
  diagnosis_list.add('Your Serum Creatinine Level is Below The Normal Range');}
  else {
    diagnosis_list.add('Your Serum Creatinine Level is Above The Normal Range');
  }
  if (serum_sodium >= 135 && serum_sodium <= 145) {
    diagnosis_list.add('Your Serum Sodium Level is In The Normal Range');
  }  else if( serum_sodium < 135){
  diagnosis_list.add('Your Serum Sodium Level is In Below Normal Range');}
  else {
    diagnosis_list.add('Your Serum Sodium Level is In Above Normal Range');
  }
  return diagnosis_list;
}
