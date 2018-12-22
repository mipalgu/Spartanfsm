//
// LightToggle.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_LightToggle_
#define clfsm_machine_LightToggle_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class LightToggle: public CLMachine
        {
            CLState *_states[4];
        public:
            LightToggle(int mid  = 0, const char *name = "LightToggle");
            virtual ~LightToggle();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "LightToggle_Variables.h"
#           include "LightToggle_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::LightToggle *CLM_Create_LightToggle(int mid, const char *name);
}

#endif // defined(clfsm_machine_LightToggle_)
