//Header file for acuator class
#ifndef actuator_h
#define actuator_h
#include <Arduino.h>
#include <Wire.h>

class Actuator {
  private:
    int counter;              // Store counter from incremental encoder.
    byte slaveadress;         // Slave adress for a given actuator.
    bool windup;              // indicates windup on integrator.

    float ang;
    float prevAngle;
    float Kp = 10.0;                                           // Controller constants, 
    float Ti = 0.0;                                            // tuned for fastest respons without,
    float Td = 5.0*1000.0;                                     // overshoot and no static error
    float Tf = 500;                                            // Filter constant
    float ui = 0;                                              // Integrator part
    float ud = 0;                                              // Derivative part
    float beta = 0;                                            // used in derivative calculation
    unsigned long currentTime;
    unsigned long previousTime;                                 // Keep track of the previousTime for given actuator
    float elapsedTime;                                          // Scan time
    float error;
    float lastError;                                            // Store last error
    float input, output, setPoint;
    float cumError;                                             // Integral
    float prevOut;                                              // Derivate
    float velocity;

  public:
    Actuator(byte encAddr);                                     // Constructor function for actuator class
    void setSetpoint(float r);                                  // Set function for setpoint
    void setParameters(float kp, float ti);                     // Set fucntion for PID parameters
    float getKp();                                              // Get function for PID parameters
    float getTi();                                              // Get function for PID parameters
    float getAngle();                                           // Get function for angle
    void readAngle();                                           // Calculate the angle(-360,360) from the counter given by the encoder in the slave
    void computePID();                                          // Computes the pid value, this is an angle
    float getSetpoint();                                        // Get function for actuator setpoint
    int getEffort();                                             // Get function for actuator speed
    float getVelocity();                                             // Get function for current velocity
};

#endif
