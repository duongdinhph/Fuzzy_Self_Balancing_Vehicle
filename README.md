![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/e05d398b-522d-4933-a93b-53ea6b5feaa3)![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/bdc8223d-ea82-45e8-a844-041774b1815f)# Fuzzy_Self_Balancing_Vehicle
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
Let $x_d, \theta_d, \Psi_d$ be the desired states when we control the vehicle. Let set $\theta_d = 0$, and the other desired states depend on the desired trajectory.
We define the Sugeno model as follows
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/f384042c-9db5-4f1f-ac67-914097177e8e)

![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/e5760b8c-8fdf-45ab-9859-74d37e21ae95)

![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/c20aa509-55e4-4154-9418-cb9f4c46023e)

## Simulation
The simulation results are excellent
For x:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/d9dbb0ba-2bba-468a-860a-b35ec5cab605)

For Theta:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/df57222e-0aad-41da-99a8-7f19d69d0e22)

For Psi:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/c23ec582-af23-4ee6-9cc5-d12d45c0f9a0)


# Implement on a real TWSBV
The results are comparable to the simulation.
For x:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/8b77bd63-ac28-4cdb-98d4-d72fd42b2992)

For Theta:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/af2efa8c-c21a-4965-86be-44bb3022b1c4)

For Psi:
![image](https://github.com/duongdinhph/Fuzzy_Self_Balancing_Vehicle/assets/56771011/d9160dae-a4e9-49f6-abd1-cdc482577632)


