//
// State_Check.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SevenSegDigit_State_Check_h
#define clfsm_SevenSegDigit_State_Check_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSevenSegDigit
      {
        namespace State
        {
            class Check: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_3: public CLTransition
                {
                public:
                    Transition_3(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_4: public CLTransition
                {
                public:
                    Transition_4(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_5: public CLTransition
                {
                public:
                    Transition_5(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_6: public CLTransition
                {
                public:
                    Transition_6(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_7: public CLTransition
                {
                public:
                    Transition_7(int toState = 10): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_8: public CLTransition
                {
                public:
                    Transition_8(int toState = 11): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_9: public CLTransition
                {
                public:
                    Transition_9(int toState = 12): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_10: public CLTransition
                {
                public:
                    Transition_10(int toState = 13): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_11: public CLTransition
                {
                public:
                    Transition_11(int toState = 14): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_12: public CLTransition
                {
                public:
                    Transition_12(int toState = 15): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_13: public CLTransition
                {
                public:
                    Transition_13(int toState = 16): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_14: public CLTransition
                {
                public:
                    Transition_14(int toState = 17): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_15: public CLTransition
                {
                public:
                    Transition_15(int toState = 19): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[16];

                public:
                    Check(const char *name = "Check");
                    virtual ~Check();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 16; }

#                   include "State_Check_Variables.h"
#                   include "State_Check_Methods.h"
            };
        }
      }
    }
}

#endif
