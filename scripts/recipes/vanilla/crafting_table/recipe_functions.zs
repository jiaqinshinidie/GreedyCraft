/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission. 
 */ 

#priority 4000
#no_fix_recipe_book

//Powered by TCreopargh

import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;

val errorStone = <minecraft:stone>.withTag({display: {Name: game.localize("greedycraft.misc.bug_stone.name"), Lore: [game.localize("greedycraft.misc.bug_stone.tooltip.1"), game.localize("greedycraft.misc.bug_stone.tooltip.2")]}}) as IItemStack;

recipes.addShapeless("nametag_to_human_spawn_egg", <minecraft:spawn_egg>, [<minecraft:name_tag>.marked("nametag"), <minecraft:egg>], 
function(out, ins, cInfo) {
    var name = ins.nametag.displayName;
    return <minecraft:spawn_egg>.withTag({display: {Name: "§e" + name + game.localize("greedycraft.misc.spawn_egg")}, EntityTag: {Username: name, id: "headcrumbs:human"}});
}, null);
recipes.addShapeless("head_to_human_spawn_egg", <minecraft:spawn_egg>, [<minecraft:skull:3>.marked("head"), <minecraft:egg>], 
function(out, ins, cInfo) {
    var name = "null";
    if (ins.head.tag.asString().contains("SkullOwner:")) {
        var nameData = ins.head.tag.memberGet("SkullOwner") as IData;
        if (nameData.asString().contains("Name:")) {
            nameData = nameData.memberGet("Name") as IData;
        }
        if (!isNull(nameData)) {
            name = nameData.asString();
        }
    }
    return <minecraft:spawn_egg>.withTag({display: {Name: "§e" + name + game.localize("greedycraft.misc.spawn_egg")}, EntityTag: {Username: name, id: "headcrumbs:human"}});
},null);
recipes.addShapeless("nametag_to_head", <minecraft:skull>, [<minecraft:name_tag>.marked("nametag1"), <minecraft:skull:*>], 
function(out, ins, cInfo) {
    var name = ins.nametag1.displayName;
    return <minecraft:skull:3>.withTag({display: {Name: "§e" + name + game.localize("greedycraft.misc.head")}, SkullOwner: name});
},null);

recipes.addShaped("dank_null_1", <danknull:dank_null_1>, [
    [null, <danknull:dank_null_panel_1>, null],
    [<danknull:dank_null_panel_1>, <danknull:dank_null_0>.marked("dank"), <danknull:dank_null_panel_1>],
    [null, <danknull:dank_null_panel_1>, null]],
function(out, ins, cInfo) {
    return out.withTag(ins.dank.tag);
}, null);
recipes.addShaped("dank_null_2", <danknull:dank_null_2>, [
    [null, <danknull:dank_null_panel_2>, null],
    [<danknull:dank_null_panel_2>, <danknull:dank_null_1>.marked("dank"), <danknull:dank_null_panel_2>],
    [null, <danknull:dank_null_panel_2>, null]],
function(out, ins, cInfo) {
    return out.withTag(ins.dank.tag);
}, null);
recipes.addShaped("dank_null_3", <danknull:dank_null_3>, [
    [null, <danknull:dank_null_panel_3>, null],
    [<danknull:dank_null_panel_3>, <danknull:dank_null_2>.marked("dank"), <danknull:dank_null_panel_3>],
    [null, <danknull:dank_null_panel_3>, null]],
function(out, ins, cInfo) {
    return out.withTag(ins.dank.tag);
}, null);
recipes.addShaped("dank_null_4", <danknull:dank_null_4>, [
    [null, <danknull:dank_null_panel_4>, null],
    [<danknull:dank_null_panel_4>, <danknull:dank_null_3>.marked("dank"), <danknull:dank_null_panel_4>],
    [null, <danknull:dank_null_panel_4>, null]],
function(out, ins, cInfo) {
    return out.withTag(ins.dank.tag);
}, null);
recipes.addShaped("dank_null_5", <danknull:dank_null_5>, [
    [null, <danknull:dank_null_panel_5>, null],
    [<danknull:dank_null_panel_5>, <danknull:dank_null_4>.marked("dank"), <danknull:dank_null_panel_5>],
    [null, <danknull:dank_null_panel_5>, null]],
function(out, ins, cInfo) {
    return out.withTag(ins.dank.tag);
}, null);

/*
recipes.addShaped("backpack_func_0", <simplybackpacks:commonbackpack>.withTag({inv: {Size: 18, Items: []}, filter: {Size: 16, Items: []}}), [
    [<ore:string>, null, <ore:string>],
    [<ore:leather>, <ore:ingotIron>, <ore:leather>], 
    [<ore:leather>, <ore:chest>, <ore:leather>]
], null, null);

recipes.addShaped("backpack_func_1", <simplybackpacks:uncommonbackpack>, [
    [<ore:string>, <ore:ingotSteel>, <ore:string>],
    [<tconstruct:materials:15>, <ore:blockGold>, <tconstruct:materials:15>], 
    [<tconstruct:materials:15>, <simplybackpacks:commonbackpack>.marked("backpack"), <tconstruct:materials:15>]
], function(out, ins, cInfo) {
    //
    var tag as IData = ins.backpack.tag;
    var inventoryTag as IData = [] as IData;
    var filterTag as IData = [] as IData;
    if ((tag has "inv") && (tag.memberGet("inv") has "Items")) {
        inventoryTag = tag.memberGet("inv").memberGet("Items") as IData;
    }
    if ((tag has "filter") && (tag.memberGet("filter") has "Items")) {
        filterTag = tag.memberGet("inv").memberGet("Items") as IData;
    }
    return out.updateTag({inv: {Size: 33, Items: inventoryTag as IData}, filter: {Size: 16, Items: filterTag as IData}});
    //
    return out.withTag(ins.backpack.tag);
}, null);

recipes.addShaped("backpack_func_2", <simplybackpacks:rarebackpack>, [
    [<thaumcraft:fabric>, <ore:ingotStainlessSteel>, <thaumcraft:fabric>],
    [<harvestcraft:hardenedleatheritem>, <ore:blockDiamond>, <harvestcraft:hardenedleatheritem>], 
    [<harvestcraft:hardenedleatheritem>, <simplybackpacks:uncommonbackpack>.marked("backpack"), <harvestcraft:hardenedleatheritem>]
], function(out, ins, cInfo) {
    return out.withTag(ins.backpack.tag);
}, null);

recipes.addShaped("backpack_func_3", <simplybackpacks:epicbackpack>, [
    [<ore:stringNylon>, <ore:ingotDurasteel>, <ore:stringNylon>],
    [<ore:clothNylon>, <ore:netherStar>, <ore:clothNylon>], 
    [<ore:clothNylon>, <simplybackpacks:rarebackpack>.marked("backpack"), <ore:clothNylon>]
], function(out, ins, cInfo) {
    return out.withTag(ins.backpack.tag);
}, null);
*/

recipes.addShaped("exp_transport_tool", errorStone, [[<ore:toolTiC>.marked("to"), <additions:greedycraft-experience_transporter>, <ore:toolTiC>.marked("from")]], 
function(out, ins, cInfo) {
    if (isNull(ins.from.tag.memberGet("Modifiers") as IData) || isNull(ins.to.tag.memberGet("Modifiers") as IData)) {
        return null;
    }
    var modifiersFrom = ins.from.tag.memberGet("Modifiers") as IData;
    var modifiersTo = ins.to.tag.memberGet("Modifiers") as IData;
    var toolLevel = {} as IData;
    if (modifiersFrom.asString().contains("toolleveling")) {
        for i in 0 to modifiersFrom.length {
            var current as IData = modifiersFrom[i];
            if (current.asString().contains("toolleveling")) {
                toolLevel = current;
                break;
            }
        }
    }
    var newModifier as IData = [];
    if (!isNull(newModifier)) {
        for i in 0 to modifiersTo.length {
            var current as IData = modifiersTo[i];
            if (isNull(current)) { 
                break;
            }
            if (current.asString().contains("toolleveling")) {
                newModifier = newModifier.update([current + toolLevel] as IData);
                break;
            } else {
                newModifier = newModifier.update([current] as IData);
            }
        }
    }
    var outData as IData = ins.to.tag - "Modifiers";
    outData = outData + ({Modifiers: newModifier}) as IData;
    
    return ins.to.withTag(outData);
}, null);

recipes.addShaped("exp_transport_armor", errorStone, [[<ore:armorTiC>.marked("to"), <additions:greedycraft-experience_transporter>, <ore:armorTiC>.marked("from")]], 
function(out, ins, cInfo) {
    if (isNull(ins.from.tag.memberGet("Modifiers") as IData) || isNull(ins.to.tag.memberGet("Modifiers") as IData)) {
        return null;
    }
    var modifiersFrom = ins.from.tag.memberGet("Modifiers") as IData;
    var modifiersTo = ins.to.tag.memberGet("Modifiers") as IData;
    var toolLevel = {} as IData;
    if (modifiersFrom.asString().contains("leveling_armor")) {
        for i in 0 to modifiersFrom.length {
            var current as IData = modifiersFrom[i];
            if (current.asString().contains("leveling_armor")) {
                toolLevel = current;
                break;
            }
        }
    }
    var newModifier as IData = [];
    if (!isNull(newModifier)) {
        for i in 0 to modifiersTo.length {
            var current as IData = modifiersTo[i];
            if (isNull(current)) { 
                break;
            }
            if (current.asString().contains("leveling_armor")) {
                newModifier = newModifier.update([current + toolLevel] as IData);
                break;
            } else {
                newModifier = newModifier.update([current] as IData);
            }
        }
    }
    var outData as IData = ins.to.tag - "Modifiers";
    outData = outData + ({Modifiers: newModifier}) as IData;
    
    return ins.to.withTag(outData);
}, null);
