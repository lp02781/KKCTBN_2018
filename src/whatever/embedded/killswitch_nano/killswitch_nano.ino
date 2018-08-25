  int pwm_value1;
  int pwm_value2;
  
  int middle_pwm = 1600;
  int a=3;
  int b=4;
  int c=5;
  int d=6;

  int e=9;
  int f=10;
  
void setup() {
  pinMode (a,OUTPUT);
  pinMode (b,OUTPUT);
  pinMode (c,OUTPUT);
  pinMode (d,OUTPUT);
  pinMode (e,INPUT);
  pinMode (f,INPUT);
  Serial.begin (9600);
}

void loop() {
  pwm_value1 = pulseIn(e, HIGH);
  pwm_value2 = pulseIn(f, HIGH);
  Serial.println(pwm_value1);
  Serial.println(pwm_value2);
  Serial.println("    ");

  if (pwm_value1>middle_pwm)
  {
    digitalWrite (a,HIGH);
    digitalWrite (b,HIGH);
  }
  else
  {
    digitalWrite (a,LOW);
    digitalWrite (b,LOW);
  }
  delay (100);
  
  if (pwm_value2>middle_pwm)
  {
    digitalWrite (c,HIGH);
    digitalWrite (d,HIGH);
  }
  else
  {
    digitalWrite (c,LOW);
    digitalWrite (d,LOW);
  }
  delay (100);
}
