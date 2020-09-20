//
// HelloWorld.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_HelloWorld_
#define clfsm_machine_HelloWorld_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class HelloWorld: public CLMachine
        {
            CLState *_states[4];
        public:
            HelloWorld(int mid  = 0, const char *name = "HelloWorld");
            virtual ~HelloWorld();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "HelloWorld_Variables.h"
#           include "HelloWorld_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::HelloWorld *CLM_Create_HelloWorld(int mid, const char *name);
}

#endif // defined(clfsm_machine_HelloWorld_)
