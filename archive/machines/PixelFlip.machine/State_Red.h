//
// State_Red.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_PixelFlip_State_Red_h
#define clfsm_PixelFlip_State_Red_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMPixelFlip
      {
        namespace State
        {
            class Red: public CLState
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
                    Red(const char *name = "Red");
                    virtual ~Red();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Red_Variables.h"
#                   include "State_Red_Methods.h"
            };
        }
      }
    }
}

#endif
