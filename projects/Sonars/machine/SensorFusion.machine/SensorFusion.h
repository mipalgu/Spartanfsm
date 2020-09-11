//
// SensorFusion.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SensorFusion_
#define clfsm_machine_SensorFusion_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SensorFusion: public CLMachine
        {
            CLState *_states[12];
        public:
            SensorFusion(int mid  = 0, const char *name = "SensorFusion");
            virtual ~SensorFusion();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 12; }
#           include "SensorFusion_Variables.h"
#           include "SensorFusion_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SensorFusion *CLM_Create_SensorFusion(int mid, const char *name);
}

#endif // defined(clfsm_machine_SensorFusion_)
