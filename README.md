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


## Technologies


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


----
## Buildings



----
## Wonders

```

Toumai [7M BC]
BAR 1000’00 [6M BC]
Ardi [4.4M BC]
Laetoli Footprints [3.5M BC]
Flat Faced Man [3.5M BC]
Lower Paleolithic Wonders
Nutcracker Man [1.8M]
Worked Pebbles (First Chopper) [1M BC]
Gesher Benot Ya’aqov [780K BC]
Peking Man Fossil [700K BC]
Terra Amata Shelter [400K BC]
Torralba and Ambrona [400K BC]
Bhimbetka Rock Shelters [300K BC]
Schöningen Spears [300K BC]
Adam’s Enki’s Calendar [80-250K BC]
Sibudu Cave [77K BC]
Kebara Cave [60K BC]
Les Eyzies-de-Tayac Cro-Magnon Shelter [45K BC]
Coliaboaia Cave [35K BC]
Chauvet Cave, Ardéche gorge, France [32K BC]
Venus of Dolní Věstonice [29K BC]
Spotted Horses, Pech Merle [25K BC]
Cougnac Caves [25K BC]
Grottes du Pape [22K BC]
Theopetra Cave [21K BC]
Coa Valley [21K BC]
Afontora Gova [20K BC]
The Lamp of Lascaux [19K BC]
Le Mas d'Azil [18K BC]
Covalanas Cave, Spain [17K BC]
Gonnersdorf and Andernach [11K BC]
Neolithic Wonders
Gobekli Tepe, Turkey [10,000 BC]
Gulf of Cambay (Khambhat), India [9500 BC]
Artefacts [edit]
Ugarit, First fortified settlement [6000 BC]
The Cairn of Barnenez [4850 BC]
Carnac Stones, France [4500 - 3300 BC]
The Unfinished Obelisk of Aswan, Egypt
Antequera, Spain [3700 BC]
Ggantija, Malta [3600 BC]
Stone Spheres, Costa Rica: 1500 - 500 BC
Olmec Heads, Mexico: 1500 - 1000 BC
Yonaguni Monument, Japan
Paleolithic Wonders
Schöningen Spears [300K BC]
Sibudu Cave [77K BC]
Venus of Dolní Věstonice [29K BC]
Spotted Horses, Pech Merle [25K BC]
Chauvet Cave, Ardéche gorge, France [25K BC]
Theopetra Cave [21K BC]
Neolithic Wonders
Gobekli Tepe, Turkey, 10,000 BC
Importance [edit]
Extra
Gulf of Cambay, India: 9500 BC
Ugarit, First fortified settlement [6000 BC]
The Cairn of Barnenez [4850 BC]
Carnac Stones, France [4500 - 3300 BC]
The Unfinished Obelisk of Aswan, Egypt [2000 BC]
Antequera, Spain: 3700 BC
Ggantija, Malta [3600 BC]
```



----
## Promotions



----
* creating game functions that don't exist (as an example, the "lack" of civilization millions of years ago)
* creating a way for climate, flora, fauna change due to the large of span of time

These are just some examples.
