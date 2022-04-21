#include "DigiKeyboard.h"
void setup() {
}

void loop() {
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("woohooooo");
  DigiKeyboard.delay(500);
  
  for (;;) {
    /*Stops the digispark from running the scipt again*/
  }
}
