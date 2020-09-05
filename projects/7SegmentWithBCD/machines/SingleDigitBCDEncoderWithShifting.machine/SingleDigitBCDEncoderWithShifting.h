//
// SingleDigitBCDEncoderWithShifting.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SingleDigitBCDEncoderWithShifting_
#define clfsm_machine_SingleDigitBCDEncoderWithShifting_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SingleDigitBCDEncoderWithShifting: public CLMachine
        {
            CLState *_states[9];
        public:
            SingleDigitBCDEncoderWithShifting(int mid  = 0, const char *name = "SingleDigitBCDEncoderWithShifting");
            virtual ~SingleDigitBCDEncoderWithShifting();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 9; }
#           include "SingleDigitBCDEncoderWithShifting_Variables.h"
#           include "SingleDigitBCDEncoderWithShifting_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SingleDigitBCDEncoderWithShifting *CLM_Create_SingleDigitBCDEncoderWithShifting(int mid, const char *name);
}

#endif // defined(clfsm_machine_SingleDigitBCDEncoderWithShifting_)
