# Customize your Sport Profile
Any Aport ULTRA allows for defining a custom sport profile. 

The user is requested to insert:
- The desired `name` of the profile
- The `sport` value
- The `subsport` value.

`sport` ans `subsport` are numbers ranging from 0 to 255. Each number is assigned to a specific 
Garmin profile. `sport` determines the main sport category (e.g. "run", "bike" etc...). `subsport`
allows for modifications on the `sport` category (e.g. "track run", "road bike" etc...).

It's then clear that not all combinations are accepted.
For example, it's not possible to assign `subsport` "road bike" to `sport` "run", as they belong to
different `sport` categories.

**If in doubt, always keep both `sport` and `subsport` values to 0. The value 0 is assigned to a
generic Garmin sport profile, which will be fine for most cases.**

# List of Constants
The following table lists **all** sport profiles, and the respective values.
Values are represented as `sport`.`subsport`

Run_Generic => 1.0 \
Run_Treadmill => 1.1 \
Run_Street => 1.2 \
Run_Trail => 1.3 \
Run_Track => 1.4 \
Run_Ultra => 1.67 \
Run_Indoor => 1.45 \
Run_Obstacle => 1.59 \
Run_Virtual => 1.58 \
Cycling_Generic => 2.0 \
Cycling_Road => 2.7 \
Cycling_Mountain => 2.8 \
Cycling_Gravel => 2.46 \
Cycling_Indoor => 2.6 \
Cycling_eBiking => 21.28 \
Cycling_eMTB => 2.47 \
Cycling_Track => 2.13 \
Cycling_Hand => 2.12 \
Cycling_Spin => 2.5 \
Cycling_Downhill => 2.9 \
Cycling_Cyclocross => 2.11 \
Cycling_BMX => 2.29 \
Cycling_Commuting => 2.48 \
Cycling_Mixed => 2.49 \
Cycling_Recumbent => 2.10 \
Cycling_Virtual => 2.58 \
Fitness_Generic => 4.0 \
Fitness_Rowing => 4.14 \
Fitness_Elliptical => 4.15 \
Fitness_Stair => 4.16 \
Fitness_Ski => 4.25 \
Fitness_JumpRope => 84.0 \
Fitness_Onshore => 59.1 \
Swimming_Generic => 5.0 \
Swimming_Lap => 5.17 \
Swimming_Open => 5.18 \
Field_Padel => 64.85 \
Field_Tennis => 8.0 \
Field_Soccer => 7.0 \
Field_Volleyball => 75.0 \
Field_Basketball => 6.0 \
Field_AmericanFootball => 9.0 \
Field_Baseball => 49.0 \
Field_Rugby => 72.0 \
Field_Hockey => 73.0 \
Field_Squash => 64.94 \
Field_Pickleball => 64.84 \
Field_Badminton => 64.95 \
Field_Racquetball => 64.96 \
Field_TableTennis => 64.97 \
Field_Cricket => 71.0 \
Field_Lacrosse => 74.0 \
Field_Softball => 50.0 \
Training_Generic => 10.0 \
Training_Flexibility => 10.19 \
Training_Strength => 10.20 \
Training_Cardio => 10.26 \
Training_Yoga => 10.43 \
Training_Pilates => 4.44 \
Training_HIIT => 62.70 \
Training_AMRAP => 62.73 \
Training_EMOM => 62.74 \
Training_TABATA => 62.75 \
Walking_Generic => 11.0 \
Walking_Hiking => 17.0 \
Walking_Mountaineering => 16.0 \
Walking_Casual => 11.30 \
Walking_Speed => 11.31 \
Walking_Indoor => 11.27 \
Winter_Generic => 58.0 \
Winter_CrossCountryClassic => 12.0 \
Winter_CrossCountrySkate => 12.42 \
Winter_AlpineSki => 13.0 \
Winter_Snowboard => 14.0 \
Winter_BackCountrySki => 13.37 \
Winter_BackCountrySnowboard => 14.37 \
Winter_IceSkate => 33.0 \
Winter_Snowshoe => 35.0 \
Water_Sail => 32.0 \
Water_Kayak => 41.0 \
Water_Paddle => 19.0 \
Water_SUP => 37.0 \
Water_Raft => 42.0 \
Water_Whitewater => 42.41 \
Water_Row => 15.0 \
Water_Windsurf => 43.0 \
Water_Kitesurf => 44.0 \
Water_Wakeboard => 39.0 \
Water_Wakesurf => 77.0 \
Water_Ski => 40.0 \
Water_Surf => 38.0 \
Water_Snorkel => 82.0 \
Water_Tube => 76.0 \
Flying_Generic => 20.0 \
Flying_HangGlide => 26.0 \
Flying_Wingsuit => 20.40 \
Flying_Skydive => 34.0 \
Flying_Jumpmaster => 46.0 \
Flying_Drone => 20.39 \
Flying_Canopy => 20.110 \
Flying_Paraglide => 20.111 \
Flying_Paramotor => 20.112 \
Flying_Pressurized => 20.113 \
Motorsport_Driving => 24.0 \
Motorsport_Motorcycling => 22.0 \
Motorsport_Motocross => 22.36 \
Motorsport_Boating => 23.0 \
Motorsport_Snowmobiling => 36.0 \
Motorsport_ATV => 22.35 \
Motorsport_Race => 57.0 \
Climbing_Generic => 31.0 \
Climbing_Floor => 48.0 \
Climbing_Indoor => 31.68 \
Climbing_Bouldering => 31.69 \
Diving_Generic => 53.0 \
Diving_Single => 53.53 \
Diving_Multi => 53.54 \
Diving_Gauge => 53.55 \
Diving_Apnea => 53.56 \
Diving_Hunt => 53.57 \
Other_Multisport => 18.0 \
Other_Golf => 25.0 \
Other_Horseback => 27.0 \
Other_Hunt => 28.0 \
Other_HuntDog => 28.72 \
Other_Fish => 29.0 \
Other_InlineSkate => 30.0 \
Other_Tactical => 45.0 \
Other_Boxe => 47.0 \
Other_MMA => 80.0 \
Other_Dance => 83.0 \
Other_DiscGolf => 69.0 \
Other_Meditation => 67.0 \
Other_Breathing => 10.62 \
Other_Offshore => 59.0 \
Other_eSport => 63.77 \
Other_Shooting => 56.0

You can find more info on the [official Garmin documentation](https://developer.garmin.com/connect-iq/api-docs/Toybox/Activity.html).