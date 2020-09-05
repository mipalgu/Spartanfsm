//
// 7SegDigit.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_7SegDigit_
#define clfsm_machine_7SegDigit_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class 7SegDigit: public CLMachine
        {
            CLState *_states[19];
        public:
            7SegDigit(int mid  = 0, const char *name = "7SegDigit");
            virtual ~7SegDigit();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 19; }
#           include "7SegDigit_Variables.h"
#           include "7SegDigit_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::7SegDigit *CLM_Create_7SegDigit(int mid, const char *name);
}

#endif // defined(clfsm_machine_7SegDigit_)
