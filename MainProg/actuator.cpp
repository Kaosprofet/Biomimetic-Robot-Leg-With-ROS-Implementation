#include "Arduino.h"
#include "actuator.h"

//This is the Cpp file for the actuator class


//Constructer function for the class
Actuator::Actuator(int enPin, int oPin){
        pinMode(enPin, INPUT);                                  //Defines input pin number
        pinMode(oPin, OUTPUT);                                  //Defines output pin number

        encoderPin = enPin;                                      //Updates the pin value
        outPin     = oPin;
}


//PID algorithm function
void Actuator::computePID(){     
        currentTime = millis();                                    //get current time
        elapsedTime = (double)(currentTime - previousTime);        //compute time elapsed from previous computation
        
        error = _setPoint - angle;                                 // determine error
        cumError += error * elapsedTime;                           // compute integral
        rateError = (error - lastError)/elapsedTime;               // compute derivative
 
        double out = _kp*error + _ki*cumError + _kd*rateError;     //PID output               
        
        if (out > maxAngle)
        {
                out = maxAngle;
        }

        if (out < minAngle)
        {
                out = minAngle;
        }
        
        
        lastError = error;                                        //remember current error
        previousTime = currentTime;                               //remember current time
 
         angle = out;                                             //have function return the PID output
}


//Sets a new setpoint
void Actuator::setSetpoint(int r){
        _setPoint = r;
}

//Sets a output, generated by pid
void Actuator::setOutput(){
        output= (angle*255.0)/360.0;
        analogWrite(outPin, output);
}


//Gets the current actuator position
void Actuator::getAngle(){           //Gjøres ikke så enkelt som dette, må se hvilken enkoder vi ender opp med
        input = analogRead(encoderPin) ; //Reads a value between 0 and 1023
        angle = (input * 360) / 1023 ;
}

//Sets new PID parameters
void Actuator::setParameters(double kp, double ti, double td ){  //Oppdaterer regulator parameterene
        _kp=kp;
        _ki=ti;
        _kd=td;
}