//
// LightShow.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_LightShow_
#define clfsm_machine_LightShow_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class LightShow: public CLMachine
        {
            CLState *_states[3];
        public:
            LightShow(int mid  = 0, const char *name = "LightShow");
            virtual ~LightShow();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 3; }
#           include "LightShow_Variables.h"
#           include "LightShow_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::LightShow *CLM_Create_LightShow(int mid, const char *name);
}

#endif // defined(clfsm_machine_LightShow_)
