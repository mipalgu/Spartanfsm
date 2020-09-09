//
// ParameterisedHelloWorld.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_ParameterisedHelloWorld_
#define clfsm_machine_ParameterisedHelloWorld_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class ParameterisedHelloWorld: public CLMachine
        {
            CLState *_states[5];
        public:
            ParameterisedHelloWorld(int mid  = 0, const char *name = "ParameterisedHelloWorld");
            virtual ~ParameterisedHelloWorld();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "ParameterisedHelloWorld_Variables.h"
#           include "ParameterisedHelloWorld_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::ParameterisedHelloWorld *CLM_Create_ParameterisedHelloWorld(int mid, const char *name);
}

#endif // defined(clfsm_machine_ParameterisedHelloWorld_)
