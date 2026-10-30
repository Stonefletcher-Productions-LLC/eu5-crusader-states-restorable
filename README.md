# Crusader States — Restorable

**Join the Discord: [discord.gg/9Y5GVYTxf](https://discord.gg/9Y5GVYTxf)** · [stonefletcher.com](https://stonefletcher.com) · by Stonefletcher Productions LLC

A **Europa Universalis V 1.4** mod. The Kingdom of Jerusalem, the County of Tripoli and the Principality of Antioch do **not** exist in 1337. The map starts exactly as in vanilla, and these crowns come back only if Catholic Christendom wins them back.

This is a variant of [Crusader States — Restoration](https://github.com/Stonefletcher-Productions-LLC/eu5-crusader-states), where the three states already exist at the start. **Use one or the other, never both.**

**Current version: 0.1.0**, for EU5 1.4.6. Static checks pass; in-game testing is pending.

## How the states come back

**Win a crusade.** When a crusade ends in victory, every Catholic country on the winning side becomes a *crusade veteran* for 50 years. Any of them that now holds the seat of Jerusalem, Tripoli or Antioch gets the event **The Crowns of Outremer**:

- **Restore them under the protection of the Holy See.** Each state whose seat you hold rises from the lands you hold there, as a Catholic monarchy and a *Crusader State* of the Papal States. You gain prestige and religious influence.
- **Restore them as our own vassals.** The same, but they become your vassals. (Not offered to the Pope.)
- **These lands belong to our crown.** You keep the land and can form the states yourself later.

Restored states take their historic court culture (French for Jerusalem, Languedocien for Tripoli, Norman for Antioch), a monarchy and Catholic faith. Their people keep their own cultures and faiths. Releasing gives your cores on those lands to the new state.

**Or form them.** Crusade veterans can form each state as a formable nation:

| State | Seat you must own | Land counted (75% needed) |
| --- | --- | --- |
| Kingdom of Jerusalem | Jerusalem | Filastin |
| County of Tripoli | Tripoli | Lebanon |
| Principality of Antioch | Antioch | Antakya and Latakia |

Catholic military orders can also form Tripoli and Antioch. Vanilla's own Jerusalem formable (Cyprus, Naples and military orders) still works.

## What the restored states get

These come from Crusader States — Restoration:

- **Crusader State** subject type: no tribute to Rome, +25 loyalty, +25% fort defence, +20% garrison size and cheaper fort upkeep while under Papal protection.
- **Crusader Knights**, a heavy cavalry unit for all three.
- Unique advances for Jerusalem (five), Tripoli (three) and Antioch (three), plus vanilla Jerusalem's own advances.
- **Crusader volunteers**: Jerusalem as a Papal Crusader State receives waves of knights and infantry when a larger enemy attacks it.
- Their own flags and map colours.

Not included: the starting rulers, armies, economy and Restoration Chronicle of the original mod, since those belong to a 1337 start.

## Install

Subscribe on the Steam Workshop, or download the release zip and run `Install-Restorable.cmd`. It copies the mod to `Documents\Paradox Interactive\Europa Universalis V\mod\crusader_states_restorable`. Start a new campaign.

## Building

`python tools/build.py --game "<Steam>\steamapps\common\Europa Universalis V\game"` writes the per-state scripts from `data/states.json`, checks them against the installed game, and packages `dist/Crusader-States-Restorable-<version>.zip`. The `--game` check is optional; without it only the mod's own files are checked.
