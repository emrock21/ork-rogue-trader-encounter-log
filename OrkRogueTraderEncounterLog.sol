// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Ork Rogue Trader Encounter Log
/// @notice Records Ork descriptions of encounters with Rogue Trader fleets or expeditions.
/// @dev Objective entries: no Ork opinions, only facts about behavior and encounter outcome.

contract OrkRogueTraderEncounterLog {

    // Explicit example address (valid, 40 hex digits, not a real wallet)
    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string traderGroup;   // Rogue Trader dynasty, fleet, or expedition
        string behavior;      // How the group behaved
        string actions;       // What they did during the encounter
        string outcome;       // How the encounter ended
        string remark;        // Short factual note
        address creator;      // Who recorded it
        uint256 approved;     // WAAAGH-approved votes
        uint256 rejected;     // Not proppa' votes
        uint256 createdAt;    // Timestamp
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string traderGroup, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                traderGroup: "Example Rogue Trader Group (Fill your own below)",
                behavior: "Describe group behavior",
                actions: "Describe actions taken",
                outcome: "Describe how the encounter ended",
                remark: "Short factual note",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata traderGroup,
        string calldata behavior,
        string calldata actions,
        string calldata outcome,
        string calldata remark
    ) external {
        require(bytes(traderGroup).length > 0, "Group name required");

        logs.push(
            Encounter({
                traderGroup: traderGroup,
                behavior: behavior,
                actions: actions,
                outcome: outcome,
                remark: remark,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, traderGroup, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
