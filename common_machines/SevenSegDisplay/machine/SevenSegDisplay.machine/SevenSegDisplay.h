//
// SevenSegDisplay.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SevenSegDisplay_
#define clfsm_machine_SevenSegDisplay_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SevenSegDisplay: public CLMachine
        {
            CLState *_states[5];
        public:
            SevenSegDisplay(int mid  = 0, const char *name = "SevenSegDisplay");
            virtual ~SevenSegDisplay();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "SevenSegDisplay_Variables.h"
#           include "SevenSegDisplay_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SevenSegDisplay *CLM_Create_SevenSegDisplay(int mid, const char *name);
}

#endif // defined(clfsm_machine_SevenSegDisplay_)
