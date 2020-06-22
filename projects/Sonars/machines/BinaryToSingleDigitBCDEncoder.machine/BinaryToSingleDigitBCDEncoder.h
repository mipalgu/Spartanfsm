//
// BinaryToSingleDigitBCDEncoder.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_BinaryToSingleDigitBCDEncoder_
#define clfsm_machine_BinaryToSingleDigitBCDEncoder_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class BinaryToSingleDigitBCDEncoder: public CLMachine
        {
            CLState *_states[11];
        public:
            BinaryToSingleDigitBCDEncoder(int mid  = 0, const char *name = "BinaryToSingleDigitBCDEncoder");
            virtual ~BinaryToSingleDigitBCDEncoder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 11; }
#           include "BinaryToSingleDigitBCDEncoder_Variables.h"
#           include "BinaryToSingleDigitBCDEncoder_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::BinaryToSingleDigitBCDEncoder *CLM_Create_BinaryToSingleDigitBCDEncoder(int mid, const char *name);
}

#endif // defined(clfsm_machine_BinaryToSingleDigitBCDEncoder_)
