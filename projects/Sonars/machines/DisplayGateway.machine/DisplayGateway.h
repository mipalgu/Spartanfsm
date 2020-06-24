//
// DisplayGateway.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_DisplayGateway_
#define clfsm_machine_DisplayGateway_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class DisplayGateway: public CLMachine
        {
            CLState *_states[18];
        public:
            DisplayGateway(int mid  = 0, const char *name = "DisplayGateway");
            virtual ~DisplayGateway();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 18; }
#           include "DisplayGateway_Variables.h"
#           include "DisplayGateway_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::DisplayGateway *CLM_Create_DisplayGateway(int mid, const char *name);
}

#endif // defined(clfsm_machine_DisplayGateway_)
