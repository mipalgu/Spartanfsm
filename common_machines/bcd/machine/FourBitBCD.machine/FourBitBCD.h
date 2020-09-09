//
// FourBitBCD.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_FourBitBCD_
#define clfsm_machine_FourBitBCD_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class FourBitBCD: public CLMachine
        {
            CLState *_states[5];
        public:
            FourBitBCD(int mid  = 0, const char *name = "FourBitBCD");
            virtual ~FourBitBCD();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "FourBitBCD_Variables.h"
#           include "FourBitBCD_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::FourBitBCD *CLM_Create_FourBitBCD(int mid, const char *name);
}

#endif // defined(clfsm_machine_FourBitBCD_)
