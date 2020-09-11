//
// State_changeCurrentSensor.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SensorFusion_State_changeCurrentSensor_h
#define clfsm_SensorFusion_State_changeCurrentSensor_h

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
            class changeCurrentSensor: public CLState
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
                    Transition_0(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[3];

                public:
                    changeCurrentSensor(const char *name = "changeCurrentSensor");
                    virtual ~changeCurrentSensor();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 3; }

#                   include "State_changeCurrentSensor_Variables.h"
#                   include "State_changeCurrentSensor_Methods.h"
            };
        }
      }
    }
}

#endif
