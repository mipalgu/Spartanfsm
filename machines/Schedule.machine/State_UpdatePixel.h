//
// State_UpdatePixel.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_Schedule_State_UpdatePixel_h
#define clfsm_Schedule_State_UpdatePixel_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSchedule
      {
        namespace State
        {
            class UpdatePixel: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    UpdatePixel(const char *name = "UpdatePixel");
                    virtual ~UpdatePixel();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_UpdatePixel_Variables.h"
#                   include "State_UpdatePixel_Methods.h"
            };
        }
      }
    }
}

#endif
