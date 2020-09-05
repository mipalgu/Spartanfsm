//
// DigitFlipper.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_DigitFlipper_
#define clfsm_machine_DigitFlipper_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class DigitFlipper: public CLMachine
        {
            CLState *_states[10];
        public:
            DigitFlipper(int mid  = 0, const char *name = "DigitFlipper");
            virtual ~DigitFlipper();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 10; }
#           include "DigitFlipper_Variables.h"
#           include "DigitFlipper_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::DigitFlipper *CLM_Create_DigitFlipper(int mid, const char *name);
}

#endif // defined(clfsm_machine_DigitFlipper_)
