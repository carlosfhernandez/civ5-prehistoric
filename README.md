Civilization V Prehistoric Mod
==============================

Extends the game back millions years and multiple eras into the days when "man" first descended from the trees! [[wiki]](https://github.com/carlosfhernandez/civ5-prehistoric/wiki/Civilization-V---Prehistoric-Era-Mod)

Table of Contents
-----------------

1. [Game Concepts](#game-concepts)
  1. [Combat System](#t-combat-system)
  2. [Early Game](#t-early-game)
    1. [Non Settlement Game](#t-non-settlement-game)
  3. [Climate](#t-climate)
  4. [Terrain Transformation](#t-terrain-transformation)
2. [Prehistoric Mod](#prehistoric--mod)
  1. [Eras](#t-eras)
  2. [Technologies](#t-technologies)
  3. [Units](#units)
  4. [Buildings](#t-buildings)
  5. [Wonders](#t-wonders)
  6. [Promotions](#t-promotions)
  7. [Resources](#t-resources)
  8. [Policies](#t-policies)
  9. [Features](#t-features)
  10. [Terrains](#t-terrains)
  11. [Beliefs](#t-beliefs)
  12. [Traits](#t-traits)
  13. [City States](#t-city-states)
3. [General Modding](#t-general-modding)
4. [Ideas](#t-ideas)
5. [Releases](#t-releases)
6. [Reference and Notes](#t-reference-and-notes)
7. [Social Structures](#t-community)
8. [Reference](#t-reference)
  1. [Civ IV Reference](#t-civ-iv-reference)
  2. [Civ V Reference](#t-civ-v-reference)
9. [Versioning](#t-versioning)
10. [Authors](#t-authors)
11. [Copyright and license](#t-copyright-and-license)




# Game Concepts


# Prehistoric Mod


## Units


### Greats
```
   - UNITCLASS_GREAT_LEADER
     + UNIT_GREAT_LEADER
```

### Leaders
```
   - UNITCLASS_ALPHA
     + UNIT_ALPHA
   - UNITCLASS_PATRIARCH
     + UNIT_PATRIARCH
   - UNITCLASS_CHIEF
     + UNIT_CHIEF
```

### Civilian
```
   - Settle
     - UNITCLASS_TRIBE_SPLIT
       + UNIT_TRIBE_SPLIT

   - Work
     - UNITCLASS_GATHERER
       + UNIT_GATHERER
     - UNITCLASS_LABORER
       + UNIT_LABORER  
```

### Combat (Land)
```

```

#### Generic
```
- UNITCLASS_AUSTRALOPITHECUS
  + UNIT_AUSTRALOPITHECUS
```

#### Foot / Infantry - Offensive
```
 - Light

   - UNITCLASS_AUTOCHTHON
     + UNIT_AUTOCHTHON
   - UNITCLASS_CAVEMAN
     + UNIT_CAVEMAN

 - Heavy

   - UNITCLASS_NEANDERTHAL
     + UNIT_NEANDERTHAL

 - Distance


 - Unclassified

   - UNITCLASS_BARB_ALPHA
     + UNIT_BARB_ALPHA
   - UNITCLASS_BEAR_WARRIOR
     + UNIT_BEAR_WARRIOR
```

#### Foot / Infantry - Defensive
```
 - UNITCLASS_PROTECTOR
   + UNIT_PROTECTOR
```

#### Sentinel 
```
 - UNITCLASS_WATCHER
   + UNIT_WATCHER
 - UNITCLASS_LOOKOUT
   + UNIT_LOOKOUT
 - UNITCLASS_SENTINEL
   + UNIT_SENTINEL
```

#### Skirmish:

     - UNITCLASS_RUNNER
       + UNIT_RUNNER 
     - UNITCLASS_RAIDER
       + UNIT_RAIDER
     - UNITCLASS_OUTRIDER
       + UNIT_OUTRIDER  

#### Vanguard

     - UNITCLASS_BUSHMAN
       + UNIT_BUSHMAN
     - UNITCLASS_INITIATE
       + UNIT_INITIATE

#### Siege:

     - UNITCLASS_SAVAGE
       + UNIT_SAVAGE




#### Ranged:

     - UNITCLASS_ROCK_THROWER
       + UNIT_ROCK_THROWER
     - UNITCLASS_SPEAR_HUNTER
       + UNIT_SPEAR_HUNTER
     - UNITCLASS_SLINGER
       + UNIT_SLINGER
     - UNITCLASS_PRIMITIVE_ARCHER
       + UNIT_PRIMITIVE_ARCHER  
     - UNITCLASS_AXE_THROWER
       + UNIT_AXE_THROWER

#### Support

     - UNITCLASS_SHAMAN
       + UNIT_SHAMAN
     - UNITCLASS_THINKER
       + UNIT_THINKER

#### Mounted


#### Carriage


#### Companioned


#### Stealth


#### Secret


#### Noble


#### Criminal


#### Slave 


### Special 

     - UNITCLASS_HUNTER
       + UNIT_HUNTER
     - UNITCLASS_KEEPER
       + UNIT_KEEPER
     - UNITCLASS_HARBINGER
       + UNIT_HARBINGER  

### Militia


### Explore:

     - UNITCLASS_WANDERER
       + UNIT_WANDERER
     - UNITCLASS_NOMAD_WANDERER
       + UNIT_NOMAD_WANDERER    
     - UNITCLASS_ADVENTURER
       + UNIT_ADVENTURER
     - UNITCLASS_EXPLORER
       + UNIT_EXPLORER

### Recreated:

     - UNITCLASS_SETTLER
       + UNIT_SETTLER
     - UNITCLASS_WORKER
       + UNIT_WORKER

### Modified:

     - 

### Unused:

     - UNITCLASS_ATATLIST (Real Weapon)
       + UNIT_ATATLIST

### Testing:

     - UNIT_SCOUT_ONE
     - UNIT_SCOUT_TWO
     - UNIT_SCOUT_THREE







* creating game functions that don't exist (as an example, the "lack" of civilization millions of years ago)
* creating a way for climate, flora, fauna change due to the large of span of time

These are just some examples.
