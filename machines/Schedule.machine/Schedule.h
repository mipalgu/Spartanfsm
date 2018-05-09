//
// Schedule.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_Schedule_
#define clfsm_machine_Schedule_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Schedule: public CLMachine
        {
            CLState *_states[4];
        public:
            Schedule(int mid  = 0, const char *name = "Schedule");
            virtual ~Schedule();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "Schedule_Variables.h"
#           include "Schedule_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Schedule *CLM_Create_Schedule(int mid, const char *name);
}

#endif // defined(clfsm_machine_Schedule_)
