// Class for temperature conversion
class TemperatureConverter {
  // Method to convert Celsius to Reaumur
  double toReaumur(double celsius) {
    return celsius * 0.8;
  }

  // Method to convert Celsius to Fahrenheit
  double toFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  // Method to convert Celsius to Kelvin
  double toKelvin(double celsius) {
    return celsius + 273.15;
  }
}
