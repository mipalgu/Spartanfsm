//
// SixteenBitBinaryToBCDEncoder.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SixteenBitBinaryToBCDEncoder_
#define clfsm_machine_SixteenBitBinaryToBCDEncoder_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SixteenBitBinaryToBCDEncoder: public CLMachine
        {
            CLState *_states[8];
        public:
            SixteenBitBinaryToBCDEncoder(int mid  = 0, const char *name = "SixteenBitBinaryToBCDEncoder");
            virtual ~SixteenBitBinaryToBCDEncoder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "SixteenBitBinaryToBCDEncoder_Variables.h"
#           include "SixteenBitBinaryToBCDEncoder_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SixteenBitBinaryToBCDEncoder *CLM_Create_SixteenBitBinaryToBCDEncoder(int mid, const char *name);
}

#endif // defined(clfsm_machine_SixteenBitBinaryToBCDEncoder_)
