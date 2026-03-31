# Ork Rogue Trader Encounter Log

An on-chain ledger of Ork descriptions of encounters with Rogue Trader dynasties,  
fleets, and expeditions. Each entry records how the group behaved, what actions  
they took, and how the encounter ended. The community votes whether the event was  
**WAAAGH-approved** or **not proppa'.**

---

## Contract

Deployed on Base:  
`0xa66563cbd411db94938cdd122e4cdbb2b4e38c0d`  
https://basescan.org/address/0xa66563cbd411db94938cdd122e4cdbb2b4e38c0d#code

Main file: `contracts/OrkRogueTraderEncounterLog.sol`

---

## How it works

Each entry stores:

- `traderGroup` – Rogue Trader dynasty, fleet, or expedition  
- `behavior` – How the group behaved  
- `actions` – What they did during the encounter  
- `outcome` – How the encounter ended  
- `remark` – Short factual note  
- `approved` / `rejected` – Community votes  

Entry **0** is a built-in example.

---

## Example encounter

```solidity
recordEncounter(
  "Rogue Trader – House Varnak",
  "Da crew moved fast between cover, passin' signals an' shiftin' squads.",
  "Dey pushed forward in bursts, sometimes holdin', sometimes rushin' ahead.",
  "Da clash spread across da docks wiv alarms ringin' an' shuttles movin'.",
  "When da noise settled, dere were scorch marks an' broken gear everywhere."
);


Voting
voteEncounter(1, true);   // WAAAGH-approved
voteEncounter(1, false);  // Not proppa'


Closing Note
A shifting, unpredictable chronicle of Rogue Trader dealings —
the dynasties that brought fire, trade, or treachery to the field,
and the ones that slipped away before the WAAAGH got loud.
