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


## Eras

```
7.2.4. Paleocene [66M - 56M]
7.2.5. Eocene [56M - 34M]
7.2.6. Oligocene [34M - 23M BC]
7.2.6.1. Old World Monkeys, New World Monkeys and the First Apes
7.2.7. Miocene "Age of Primates" [23M - 5.3M BC]
7.2.8. Pliocene [5.3M - 2.6M]
7.2.8.1 Climate
7.2.8.2 Paleogeography
7.2.8.3 Flora
7.2.8.4 Fauna
7.2.9. Paleolithic: "Old Stone Age" [2.6M - 20K BC]
7.2.9.1. Lower Paleolithic [2.6M - 300K BC]
7.2.9.2. Middle Paleolithic [300K - 50K BC]
7.2.9.3. Upper Paleolithic [50K - 20K BC]
7.2.9.3.1. Tech Details
7.2.9.3.1.1. Idols / Venus Figurines  - Notable
7.2.9.3.1.2. Other
7.2.10. Mesolithic: "Middle Stone Age" [20K - 10K BC]
7.2.11. Neolithic "New Stone Age" [10,000 BC - 3600 BC]
Unassigned Stone Age
7.2.12. Copper Age (Chalcolithic) [3600 - 2600 BC]
7.2.13. Bronze Age [2600 - 1200 BC]
7.2.14. Iron Age or Classical Era [1200 BC - 600 AD]
```



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
