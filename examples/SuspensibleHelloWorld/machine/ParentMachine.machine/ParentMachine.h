//
// ParentMachine.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_ParentMachine_
#define clfsm_machine_ParentMachine_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class ParentMachine: public CLMachine
        {
            CLState *_states[7];
        public:
            ParentMachine(int mid  = 0, const char *name = "ParentMachine");
            virtual ~ParentMachine();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 7; }
#           include "ParentMachine_Variables.h"
#           include "ParentMachine_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::ParentMachine *CLM_Create_ParentMachine(int mid, const char *name);
}

#endif // defined(clfsm_machine_ParentMachine_)
