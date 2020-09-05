//
// DisplayTransmitter.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_DisplayTransmitter_
#define clfsm_machine_DisplayTransmitter_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class DisplayTransmitter: public CLMachine
        {
            CLState *_states[6];
        public:
            DisplayTransmitter(int mid  = 0, const char *name = "DisplayTransmitter");
            virtual ~DisplayTransmitter();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "DisplayTransmitter_Variables.h"
#           include "DisplayTransmitter_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::DisplayTransmitter *CLM_Create_DisplayTransmitter(int mid, const char *name);
}

#endif // defined(clfsm_machine_DisplayTransmitter_)
