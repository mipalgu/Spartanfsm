//
// SuspensibleHelloWorld.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SuspensibleHelloWorld_
#define clfsm_machine_SuspensibleHelloWorld_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SuspensibleHelloWorld: public CLMachine
        {
            CLState *_states[3];
        public:
            SuspensibleHelloWorld(int mid  = 0, const char *name = "SuspensibleHelloWorld");
            virtual ~SuspensibleHelloWorld();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "SuspensibleHelloWorld_Variables.h"
#           include "SuspensibleHelloWorld_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SuspensibleHelloWorld *CLM_Create_SuspensibleHelloWorld(int mid, const char *name);
}

#endif // defined(clfsm_machine_SuspensibleHelloWorld_)
