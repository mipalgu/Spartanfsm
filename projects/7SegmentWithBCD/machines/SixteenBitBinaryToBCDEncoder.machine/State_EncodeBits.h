//
// State_EncodeBits.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SixteenBitBinaryToBCDEncoder_State_EncodeBits_h
#define clfsm_SixteenBitBinaryToBCDEncoder_State_EncodeBits_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSixteenBitBinaryToBCDEncoder
      {
        namespace State
        {
            class EncodeBits: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    EncodeBits(const char *name = "EncodeBits");
                    virtual ~EncodeBits();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_EncodeBits_Variables.h"
#                   include "State_EncodeBits_Methods.h"
            };
        }
      }
    }
}

#endif
