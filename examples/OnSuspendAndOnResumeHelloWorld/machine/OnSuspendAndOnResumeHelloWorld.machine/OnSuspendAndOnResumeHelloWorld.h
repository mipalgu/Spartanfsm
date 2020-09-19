//
// OnSuspendAndOnResumeHelloWorld.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_OnSuspendAndOnResumeHelloWorld_
#define clfsm_machine_OnSuspendAndOnResumeHelloWorld_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class OnSuspendAndOnResumeHelloWorld: public CLMachine
        {
            CLState *_states[4];
        public:
            OnSuspendAndOnResumeHelloWorld(int mid  = 0, const char *name = "OnSuspendAndOnResumeHelloWorld");
            virtual ~OnSuspendAndOnResumeHelloWorld();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "OnSuspendAndOnResumeHelloWorld_Variables.h"
#           include "OnSuspendAndOnResumeHelloWorld_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::OnSuspendAndOnResumeHelloWorld *CLM_Create_OnSuspendAndOnResumeHelloWorld(int mid, const char *name);
}

#endif // defined(clfsm_machine_OnSuspendAndOnResumeHelloWorld_)
