--
-- Please see the license file included with this distribution for
-- attribution and copyright information.
--
-- luacheck: globals HpManager
-- luacheck: globals applyDwarvenToughness

local applyDwarvenToughnessOriginal;

function onInit()
    applyDwarvenToughnessOriginal = CharSpeciesManager.applyDwarvenToughness;
    CharSpeciesManager.applyDwarvenToughness = applyDwarvenToughness;
end

function applyDwarvenToughness(nodeChar, bInitialAdd)
    applyDwarvenToughnessOriginal(nodeChar, bInitialAdd);
    HpManager.recalculateBase(nodeChar);
end
