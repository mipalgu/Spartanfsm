//
// SonarPlatform.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SonarPlatform_
#define clfsm_machine_SonarPlatform_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SonarPlatform: public CLMachine
        {
            CLState *_states[6];
        public:
            SonarPlatform(int mid  = 0, const char *name = "SonarPlatform");
            virtual ~SonarPlatform();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SonarPlatform_Variables.h"
#           include "SonarPlatform_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SonarPlatform *CLM_Create_SonarPlatform(int mid, const char *name);
}

#endif // defined(clfsm_machine_SonarPlatform_)
