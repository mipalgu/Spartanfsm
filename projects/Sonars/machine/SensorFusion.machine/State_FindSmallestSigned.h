//
// State_FindSmallestSigned.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SensorFusion_State_FindSmallestSigned_h
#define clfsm_SensorFusion_State_FindSmallestSigned_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSensorFusion
      {
        namespace State
        {
            class FindSmallestSigned: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    FindSmallestSigned(const char *name = "FindSmallestSigned");
                    virtual ~FindSmallestSigned();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_FindSmallestSigned_Variables.h"
#                   include "State_FindSmallestSigned_Methods.h"
            };
        }
      }
    }
}

#endif
