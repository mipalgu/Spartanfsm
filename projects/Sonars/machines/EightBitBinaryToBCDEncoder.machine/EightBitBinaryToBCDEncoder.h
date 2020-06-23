//
// EightBitBinaryToBCDEncoder.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_EightBitBinaryToBCDEncoder_
#define clfsm_machine_EightBitBinaryToBCDEncoder_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class EightBitBinaryToBCDEncoder: public CLMachine
        {
            CLState *_states[8];
        public:
            EightBitBinaryToBCDEncoder(int mid  = 0, const char *name = "EightBitBinaryToBCDEncoder");
            virtual ~EightBitBinaryToBCDEncoder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "EightBitBinaryToBCDEncoder_Variables.h"
#           include "EightBitBinaryToBCDEncoder_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::EightBitBinaryToBCDEncoder *CLM_Create_EightBitBinaryToBCDEncoder(int mid, const char *name);
}

#endif // defined(clfsm_machine_EightBitBinaryToBCDEncoder_)
