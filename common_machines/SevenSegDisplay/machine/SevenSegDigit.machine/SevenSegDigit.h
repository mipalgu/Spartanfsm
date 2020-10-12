//
// SevenSegDigit.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_SevenSegDigit_
#define clfsm_machine_SevenSegDigit_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SevenSegDigit: public CLMachine
        {
            CLState *_states[18];
        public:
            SevenSegDigit(int mid  = 0, const char *name = "SevenSegDigit");
            virtual ~SevenSegDigit();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 18; }
#           include "SevenSegDigit_Variables.h"
#           include "SevenSegDigit_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SevenSegDigit *CLM_Create_SevenSegDigit(int mid, const char *name);
}

#endif // defined(clfsm_machine_SevenSegDigit_)
