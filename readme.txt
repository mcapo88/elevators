Elevators - Mark Capobianco

Admittedly elevators is not in completed state.

Excuse time: Ran out of time trying to balance end of year workload and work workload. I plan on working on this in my free time over the summer because I want to eventually implement all requirements.

I would like explain what happens when my simulation is run

The Simulation class creates a Building object which in turn creates an elevator and the floors in the building. These objects register their existence to the simulation class.

Simulation then creates a series of people with a starting floor and destination floor and puts them in the starting floors waiting queue of my choosing (future state: both starting and destination floor for will be random and will use the nPeople variable). Each Person registers with simulation, not using this right now.

load_elevator adds people to elevator from the ground floor (this was done for testing. future would not use this.)

The elevator starts at floor 0 and travels back and forth from bottom to top in cycle given how many ticks the simulation runs for. At each floor it lets passengers off at their destination floor then allow waiting passengers to enter if they don't exceed the elevators capacity (5). (future: will utilize the elevator resting floor and call button. currently not implemented)

My spefic sequence is as follows. Bugs present. people represented by (start floor,destination floor)
Elevator @ Floor 0 - (0,1),(0,3),(0,4),(0,3),(0,4) are loaded on the elevator from ground floor.
Elevator @ Floor 1 - (0,1) gets off, (1,4) enters. Elevator is at capacity.
Elevator @ Floor 2 - No one gets off, (2,0) cannot enter. Elevator is at capacity.
Elevator @ Floor 3 - (0,3),(0,3) get off, (3,1) enters.
Elevator @ Floor 4 - (0,4),(1,4) get off, (4,2) enters. - Bug here 3 people should get off there is another (0,4) that decided to stay on the elevator (wtf - just found this)
Elevator @ Floor 3 - No Activity
Elevator @ Floor 2 - (4,2) gets off, (2,0) enters.
Elevator @ Floor 1 - (3,1) gets off, 
Elevator @ Floor 0 - (2,0) gets off

After this point there is a logic error, elevator cycles between Floors 1 and 0 in a loop.


Overall, I wish I was in better shape. Please be gentle. I will continue to work on this just for the satisfaction of beating elevators.


