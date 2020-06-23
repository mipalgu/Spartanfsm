//
// 8BitBinaryToBCDEncoder.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_8BitBinaryToBCDEncoder_
#define clfsm_machine_8BitBinaryToBCDEncoder_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class 8BitBinaryToBCDEncoder: public CLMachine
        {
            CLState *_states[8];
        public:
            8BitBinaryToBCDEncoder(int mid  = 0, const char *name = "8BitBinaryToBCDEncoder");
            virtual ~8BitBinaryToBCDEncoder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 8; }
#           include "8BitBinaryToBCDEncoder_Variables.h"
#           include "8BitBinaryToBCDEncoder_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::8BitBinaryToBCDEncoder *CLM_Create_8BitBinaryToBCDEncoder(int mid, const char *name);
}

#endif // defined(clfsm_machine_8BitBinaryToBCDEncoder_)
