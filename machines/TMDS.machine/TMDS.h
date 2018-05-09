//
// TMDS.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_TMDS_
#define clfsm_machine_TMDS_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class TMDS: public CLMachine
        {
            CLState *_states[6];
        public:
            TMDS(int mid  = 0, const char *name = "TMDS");
            virtual ~TMDS();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "TMDS_Variables.h"
#           include "TMDS_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::TMDS *CLM_Create_TMDS(int mid, const char *name);
}

#endif // defined(clfsm_machine_TMDS_)
