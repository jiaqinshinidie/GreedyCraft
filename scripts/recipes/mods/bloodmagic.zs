/*
 * This script is created for the GreedyCraft modpack by TCreopargh.
 * You may NOT use this script in any other publicly distributed modpack without my permission.
 */

#priority 1050
#no_fix_recipe_book

import mods.bloodmagic.TartaricForge;
import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.AlchemyArray;

TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_sword>]);
TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_axe>]);
TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_pickaxe>]);
TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_shovel>]);

for item in <ore:string>.items {
    TartaricForge.removeRecipe([<minecraft:bow>, <bloodmagic:soul_gem:1>, item, item]);
}

TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <tconevo:material>]);
TartaricForge.addRecipe(<tconevo:metal:30>, [<bloodmagic:soul_gem>, <additions:stainless_steel_ingot>], 2.0, 2.0);

BloodAltar.removeRecipe(<minecraft:redstone_block>);
BloodAltar.removeRecipe(<minecraft:diamond>);
BloodAltar.removeRecipe(<minecraft:gold_block>);
BloodAltar.removeRecipe(<tconevo:material>);

BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), <minecraft:emerald>, 0, 2000, 40, 40);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:apprentice"}), <astralsorcery:itemcraftingcomponent:1>, 1, 5000, 80, 80);
BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:magician"}), <additions:greedycraft-compressed_experience_block>, 2, 25000, 100, 100);
BloodAltar.addRecipe(<tconevo:metal:25>, <additions:durasteel_ingot>, 2, 10000, 200, 200);

AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:iron_helmet>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:iron_chestplate>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:iron_leggings>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:iron_boots>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:diamond_sword>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:diamond_pickaxe>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:diamond_axe>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:diamond_shovel>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <minecraft:diamond_hoe>);
AlchemyArray.removeRecipe(<bloodmagic:component:8>, <animus:kama_bound>);

AlchemyArray.addRecipe(<bloodarsenal:blood_diamond:3>, <bloodmagic:component:8>, <bloodarsenal:blood_diamond:2>, "bloodmagic:textures/models/AlchemyArrays/bindingarray.png");
AlchemyArray.addRecipe(<bloodmagic:blood_shard:1>, <bloodmagic:slate:3>, <bloodmagic:blood_shard>, "bloodmagic:textures/models/AlchemyArrays/bindingarray.png");
