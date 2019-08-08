//
// UltrasonicDistanceSensor.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_UltrasonicDistanceSensor_
#define clfsm_machine_UltrasonicDistanceSensor_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class UltrasonicDistanceSensor: public CLMachine
        {
            CLState *_states[7];
        public:
            UltrasonicDistanceSensor(int mid  = 0, const char *name = "UltrasonicDistanceSensor");
            virtual ~UltrasonicDistanceSensor();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "UltrasonicDistanceSensor_Variables.h"
#           include "UltrasonicDistanceSensor_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::UltrasonicDistanceSensor *CLM_Create_UltrasonicDistanceSensor(int mid, const char *name);
}

#endif // defined(clfsm_machine_UltrasonicDistanceSensor_)
