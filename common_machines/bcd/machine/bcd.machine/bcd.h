//
// bcd.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_bcd_
#define clfsm_machine_bcd_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class bcd: public CLMachine
        {
            CLState *_states[4];
        public:
            bcd(int mid  = 0, const char *name = "bcd");
            virtual ~bcd();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "bcd_Variables.h"
#           include "bcd_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::bcd *CLM_Create_bcd(int mid, const char *name);
}

#endif // defined(clfsm_machine_bcd_)
