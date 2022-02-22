#include <OneWire.h>
#include <DallasTemperature.h>

#define led_encendido 13
#define led_funcionando 12
#define led_alerta 14

// GPIO where the DS18B20 is connected to
const int oneWireBus = 27;

// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(oneWireBus);

// Pass our oneWire reference to Dallas Temperature sensor 
DallasTemperature sensors(&oneWire);

int estadoTemperatura;

void setup() {
  Serial.begin(115200);

  // Start the DS18B20 sensor
  sensors.begin();
  
  pinMode(led_encendido, OUTPUT);
  pinMode(led_funcionando, OUTPUT);
  pinMode(led_alerta, OUTPUT);
}

void loop() {
  digitalWrite(led_encendido, HIGH);
  estadoTemperatura = comprobarTemperatura(obtenerTemperatura());
  accionTemperatura(estadoTemperatura);
  delay(5000);
}

float obtenerTemperatura(){
  sensors.requestTemperatures(); 
  float temperatureC = sensors.getTempCByIndex(0);
  Serial.print(temperatureC);
  Serial.println("ºC");
}

int comprobarTemperatura(float temperatura){
  if (temperatura < 20  or temperatura > 33.0){
    return 3; // Alerta
  }
  if (temperatura > 24 and temperatura < 29.0){
    return 0; // OK
  }
  else if (temperatura < 24){
    return 1; // Frio
  }
  else if (temperatura > 29){
    return 2; // Calor
  }
}

void accionTemperatura(int estadoTemperatura){
  digitalWrite(led_alerta, LOW);
  digitalWrite(led_funcionando, LOW);
  switch(estadoTemperatura){
    // Ok
    case 0:
      break;
    // Frio
    case 1:
      Serial.println("Frioo");
      digitalWrite(led_funcionando, HIGH);
      break;
    // Calor
    case 2:
      Serial.println("Calientee");
      digitalWrite(led_funcionando, HIGH);
      break;
    // Alerta
    case 3:
      digitalWrite(led_alerta, HIGH);
      break;
  }
}
