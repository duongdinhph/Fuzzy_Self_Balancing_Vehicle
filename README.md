# Fuzzy_Self_Balancing_Vehicle
Implement Sugeno and Mamdani Fuzzy Rules for Adaptive Controller on a Two-wheels Self-balancing Vehicle (TWSBV)
# Identifying Linear Model
## Simulation
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/0b30f06a-21a4-43ca-ae90-540ca2532fc6)
Set the input signal $u = 0.5  * Step(t-5)$,
## Approximating the model
Approximate the model to $G(s) = \frac{k}{s(Ts+1)}$ with $k=9.6250; T=0.388$
Based on the linear model, design an optimal PID controller, we get: $K_p=-6.26684; K_I=-9.07996; K_D=-0.79364$
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/f5436126-0863-49f2-93d7-32d15bb85213)

Conduct the simulation with the PID controller, and inject a noisy pulse to test the stability of the system
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/4cfdcbb4-cf2a-4181-b462-ebe48e2dabd4)

It results in a very good performance!
# Design Fuzzy Rules
## Fuzzy rules
## Simulation
# Implement on a real TWSBV
