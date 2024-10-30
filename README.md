
# Life Ledger

[![Build FG Extension](https://github.com/rhagelstrom/LifeLedger/actions/workflows/create-release.yml/badge.svg)](https://github.com/rhagelstrom/LifeLedger/actions/workflows/create-release.yml) [![Luacheckrc](https://github.com/rhagelstrom/LifeLedger/actions/workflows/luacheck.yml/badge.svg)](https://github.com/rhagelstrom/LifeLedger/actions/workflows/luacheck.yml) [![Markdownlint](https://github.com/rhagelstrom/LifeLedger/actions/workflows/markdownlint.yml/badge.svg)](https://github.com/rhagelstrom/LifeLedger/actions/workflows/markdownlint.yml)

**Current Version:** ~dev_version~ \
**Updated:** ~date~

**NOTE:** Upon first loading, this extension will attempt to resolve each PC's current total hit points into individual rolls. If there is a discrepancy detected, a notification will be given upon opening the character sheet. This extension disables editing of max hit points, which is auto calculated and should never be altered. Temporary adjustment of max hit points can be performed by using adjusted hit points. If there is a discrepancy in max hit points, it can be fixed as in the following image. ![Alt](.resources/discrepancy.png "Fix")

## Features

* Adds tracking of individual values for HP gained at each level, automated modifications of HP based on constitution changes, and tracking adjustments to maximum HP.
  * Values can be seen and edited in the Class & Level window.
  * Manually changed class levels take effect after the control loses focus.
* Added an option to indicate whether average hit points should be added when level or if they should be rolled.
* Added an option to toggle between displaying Wounds or Current Hit Points.
  * Inspired by the [Current HP](https://www.fantasygrounds.com/forums/showthread.php?44140-Current-HP-Extension-for-5E-Ruleset) extension created by Tielc and zuilin.
* Added an option to control whether NPCs have extra health fields for hit dice and death saving throws.
  * This may also be specified on a per-NPC basis for any combatant on the CT by right clicking on their NPC sheet.
* Adjustments to constitution, both permanent and via effect will accordingly adjust HP.
* Added a Heal action type to increase maximum HP.
* Added fields to NPC sheets on the combat tracker for Wounds, Temp HP, HP Adjustment, Hit Dice, and Death Saves. And added an option to disable showing them.
* Abilities, Class Features, Ancestral Traits, and Feats can all be configured to grant hit points (as the Tough feat, for example). Simply right click on the name of the ability's window to enable and set the desired value in the field that is shown.

## Special Damage Types

| Descriptor | Notes |
| --- | --- |
| hsteal | The attacker is healed for half of the damage dealt to the target |
| hstealtemp | The attacker is gains temporary hit points equivalent to half of the damage dealt |
| maxhp | The target's maximum hit points are reduced by the damage dealt |
| steal | The attacker is healed for the damage dealt to the target |
| stealtemp | The attacker is gains temporary hit points equivalent to the damage dealt |
| transfer | The damage is dealt to the attacker and the target is healed by the damage taken |

**Note:** steal, stealtemp, transfer - If one of these damage types is followed by a (N) damage type, where (N) is any positive number, the secondary effect is scaled by (N). E.g. `steal, 0.5` is identical to `hsteal`

## Modifier Tags

| Modifier | Value | Descriptors | Notes |
| --- | --- | --- | --- |
| HD | (D) | max | Adds (D) when the hit die is rolled |
| HDMULT | (N) | (-) | The result of a hit die roll to be multiplied by (N) **Note:** extra dice add by HD effects are not multiplied, but extra flat numbers are |
| HDRECOVERY | (N) | (-) | (N) additional hit die will be recovered on long rest |
| SHAREDMG | (N) | (-) | (T) Damage received by an Actor will be shared with another Actor by proportion (N) **See Note** |
| SHAREHEAL | (N)| (-) | (T) Healing received by an Actor will be shared with another Actor by proportion (N) **See Note** |

* **(D)** = Dice and numbers supported for value attribute
* **(N)** = Only numbers supported for value attribute
* **(-)** = Neither number nor dice supported for value attribute
* **(T)** = Effects can be targeted to only apply to modifiers against certain opponents
* **max** = Maximizes the die roll
* **Note** = When the effect is targeted, the target will receive the shared damage or healing. When the effect is not targeted, the source of the effect will receive the shared damage or healing.

## Examples

### Damage Types

| Power [Source] | Code | Notes |
| --- | --- | --- |
| Bite [Vampire] | DMG: 1d6+4 piercing + 3d6 necrotic, maxhp, steal | |
| Life Transference [Spell] | DMG: 4d6 necrotic, transfer, 2 | |
| Vampiric Touch [Spell] | DMG: 3d6 necrotic, hsteal | |

### Effects

| Power [Source] | Effect Code | Duration/Target/Expend | Notes |
| --- | --- | --- | --- |
| Warding Bond [Spell] | Warding Bond; AC: 1; SAVE: 1; RESIST: all; SHAREDMG: 1 | Duration=1 hr | Can be improved to range check with Aura |

## Options

| Name| Default | Options | Notes |
| --- | --- | --- | --- |
| Per User: HP: Display Mod | Wounds | Wounds/Current HP | Wounds, shows current wounds in the Combat Tracker. Current HP, shows how many HP Actors have remaining in the Combat Tracker |
| NPC: Show Extra Health Fields | On | On/Off | On, adds extra fields to the NPC sheet |
| PC: Clear HP Adjust on Long Rest | On | On/Off | On, will clear any adjusted HP an Actor may have when it takes a Long Rest |
| PC: HP on Level Up | Average | Average/Roll | Off, hit points  gained on level up will be the static average. On, hit points gained on level up will be rolled |

## Attribution

Based off of Constitutional Amendments by MeAndUnique

Icon based off of [Archive Register](https://game-icons.net/1x1/delapouite/archive-register.html) by Delapouite and modified by rhagelstrom with permission by [CC 3.0](https://creativecommons.org/licenses/by/3.0/).

SmiteWorks owns rights to code sections copied from their rulesets by permission for Fantasy Grounds community development.
'Fantasy Grounds' is a trademark of SmiteWorks USA, LLC.
'Fantasy Grounds' is Copyright 2004-2024 SmiteWorks USA LLC.
