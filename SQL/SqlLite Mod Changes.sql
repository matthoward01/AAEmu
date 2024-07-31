--Server and Client
    --Mount Run Skill Duration
    UPDATE buffs SET duration = 3600000 WHERE id = 1933;
    UPDATE buffs SET duration = 3600000 WHERE id = 6174;

    --Housing Tax Costs
    UPDATE taxations SET tax = 1 WHERE id != 1;

    --Portal Hereafter Stone Cost
    UPDATE open_portal_inland_reagents SET amount = 0;
    UPDATE open_portal_outland_reagents SET amount = 0;

    --Decreasing casting time of gathering type skills
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (10212,13726,13967,13970,13971,13972,13973,15426,16768,18772,
    20782,24266,25526,25527,20487,23294,14238,14239,14240,14241,14242,16770,
    13990,13991,13992,13993,13994,13820,13821,13800,13802,13801,
    13980,13981,13982,13983,13984,14581,14604,14605,14606,14607,21906,22477,22683,
    11096,14579,14614,14615,14616,14617,21582,22684,11081,14582,14608,14611,14612,14613,22373,22682,
    23293,23294,23295,23596,23597,23481,23482,14618,14619,14620,14621,22680,20487,23297,20678,16771,23297,
    26128,10204,13165,13168,13191,13703,13820,13821,20336,20595,20678,23421,25961,26129,
    20784,16453,20781,20779,25528,25529,25530,25531,25532,25533,20595,16774,22910,20606,23296,18110,13974,13975,13976,13977,13978,14622,14623,14624,14625,14626);

    UPDATE skills SET casting_time = 1000 WHERE id >= 26032 AND id <= 26109;
    UPDATE skills SET casting_time = 1000 WHERE id >= 26001 AND id <= 26009;
    UPDATE skills SET casting_time = 1000 WHERE id >= 25414 AND id <= 25493 AND id != 25415;
    UPDATE skills SET casting_time = 1000 where id >= 25855 AND id <= 25869;

    --Updating Red Regrade Charm
    UPDATE item_grade_enchanting_supports SET add_success_mul = 10000, add_great_success_ratio = 100, add_great_success_mul = 1000,
    add_break_ratio = -10000, add_downgrade_ratio = -10000 WHERE item_id = 31977;

    --Adding Gilda Stars to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9010002, 164, 23633, 1);
    UPDATE items SET living_point_price = 100 WHERE id = 23633;

    --Adding Minning Drill to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9010002, 164, 34779, 1);
    UPDATE items SET living_point_price = 2000 WHERE id = 34779;

    --Adding Fishing Pond to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9010003, 164, 34778, 1);
    UPDATE items SET living_point_price = 2000 WHERE id = 34778;
    --Bait worms to vocation shop
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9010004, 164, 27142, 1);
    UPDATE items SET living_point_price = 4 WHERE id = 27142;

    --Adding Vanilla to Seed Shop
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9010005, 171, 16270, 1);

    --Changing Bundles to use worms and adding them to the vocation vendor
    UPDATE craft_materials SET item_id = 27142, amount = 5 WHERE item_id = 777 AND craft_id IN (
    SELECT craft_id FROM craft_materials WHERE item_id IN 
        (15659,15664,15661,15663,15665,15662,15657,15666,15660,16277,
        15652,15646,15653,15651,15647,15655,15656,15654,15650,16269,
        15680,16272,17261,16282,16279,16294,15676,15675,15673,15677,
        4904,15670,15674,15669,15672,15678,15667,15682,15668,15671)
    );

    --Farm Vehicles
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t"  WHERE id=4107; --Farm Wagon
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t"  WHERE id=6029; --Farm Hauler
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t"  WHERE id=6913; --Red Farm Hauler
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (4107,6029,6913); --Adding bits to make the components clickable on the parent recipes
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('9081000', '4107', '36293', '1', 'f', '-1');

    --Components:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"  WHERE id=4103; --Strong Wheel
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"  WHERE id=4104; --Solid Shaft
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"  WHERE id=4105; --High Power Engine
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"  WHERE id=5327; --Cart Bucket
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (4103,4104,4105,5327); --Adding bits to make the components clickable on the parent recipes

    --Submarines:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=26, show_upper_crafts="t"  WHERE id=5719; --Ruby Steamfish Submarine
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=26, show_upper_crafts="t"  WHERE id=5720; --Lapis Steamfish Submarine
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=26, show_upper_crafts="t"  WHERE id=5721; --latinum Steamfish Submarine
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (5719,5720,5721); --Adding bits to make the components clickable on the parent recipes

    --Components:
    UPDATE "main"."crafts" SET req_doodad_id=2239, ac_id=27, show_upper_crafts="t"  WHERE id=5717; --Buoyancy Controller
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" = 5717; --Adding bits to make the components clickable on the parent recipes

    --Ironclads:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=5325; --Fire Ironclad
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=5326; --Ironclad
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (5325,5326); --Adding bits to make the components clickable on the parent recipes

    --Components:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t" WHERE id=4102; --Tank Cannon
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"WHERE id=4106; --Vehicle Controlling Device

    --Cars:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=162; --Comet Speedster
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=163; --Apex Squall
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=164; --Timber Coupe
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (162,163,164); --Adding bits to make the components clickable on the parent recipes

    --Components:
    UPDATE "main"."crafts" SET req_doodad_id=564, ac_id=45, show_upper_crafts="t" WHERE id=98; --Crafted Vehicle Frame: Comet Speedster
    UPDATE "main"."crafts" SET req_doodad_id=564, ac_id=45, show_upper_crafts="t" WHERE id=99; --Crafted Vehicle Frame: Apex Squall
    UPDATE "main"."crafts" SET req_doodad_id=654, ac_id=45, show_upper_crafts="t" WHERE id=100; --Crafted Vehicle Frame: Timber Coupe
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t" WHERE id=157; --Bright Headlight
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t" WHERE id=158; --Rubber Tire
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=27, show_upper_crafts="t"  WHERE id=159; --Hydraulic Shaft
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (98,99,100,157,158,159); --Adding bits to make the components clickable on the parent recipes

    --Top-tier cars:
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=6024; --Nova Speedster
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=6027; --Apex Drift
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24, show_upper_crafts="t" WHERE id=6028; --Redwood Roadster
    UPDATE "main"."craft_products" SET show_lower_crafts="t" WHERE "craft_id" in (6024,6027,6028); --Adding bits to make the components clickable on the parent recipes
    
    --And finally, adding the platinum steamfish plan to the vocation vendor, which the plan description says, can optionally be done with:
    INSERT INTO "main"."merchant_goods" ("id", "merchant_pack_id", "item_id", "grade_id") VALUES ('9081001', '164', '29276', '0'); -- Platinum Steamfish Plan
    
    --Obsidian Weapons
    UPDATE "main"."crafts" SET req_doodad_id=532 WHERE id in (6927,6928,6929,6961,6962,6963,6978,6979,6980); --Carpentry weapons
    UPDATE "main"."crafts" SET req_doodad_id=564 WHERE id in (6930,6931,6964,6965,6981,6982); --handicraft weapons
    UPDATE "main"."crafts" SET req_doodad_id=520 WHERE id in (6916,6917,6918,6919,6920,6921,6922,6923,6924,6925,6926,6932,6950,6951,6952,6953,6955,6956,6957,6958,6959,6960,6966,6967,6968,6969,6970,6971,6972,6973,6974,6975,6976,6977,6983); --anvil weapons


    UPDATE "main"."crafts" SET ac_id=1 WHERE id in (6916,6950,6967);--Daggers
    UPDATE "main"."crafts" SET ac_id=2 WHERE id in (6917,6951,6968);--sword
    UPDATE "main"."crafts" SET ac_id=56 WHERE id in (6918,6952,6969);--greatsword
    UPDATE "main"."crafts" SET ac_id=4 WHERE id in (6919,6953,6970);--katana
    UPDATE "main"."crafts" SET ac_id=57 WHERE id in (6920,6954,6971);--nodachi
    UPDATE "main"."crafts" SET ac_id=47 WHERE id in (6921,6955,6972);--axe
    UPDATE "main"."crafts" SET ac_id=58 WHERE id in (6922,6956,6973);--greataxe
    UPDATE "main"."crafts" SET ac_id=5 WHERE id in (6923,6957,6974);--club
    UPDATE "main"."crafts" SET ac_id=59 WHERE id in (6924,6958,6975);--greatclub
    UPDATE "main"."crafts" SET ac_id=7 WHERE id in (6925,6959,6976);--shortspear
    UPDATE "main"."crafts" SET ac_id=60 WHERE id in (6926,6960,6977);--longspear
    UPDATE "main"."crafts" SET ac_id=6 WHERE id in (6927,6961,6978);--sceptre
    UPDATE "main"."crafts" SET ac_id=61 WHERE id in (6928,6962,6979);--staves
    UPDATE "main"."crafts" SET ac_id=8 WHERE id in (6929,6963,6980);--bow
    UPDATE "main"."crafts" SET ac_id=11 WHERE id in (6930,6964,6981);--Lute
    UPDATE "main"."crafts" SET ac_id=12 WHERE id in (6931,6965,6982);--Flute
    UPDATE "main"."crafts" SET ac_id=10 WHERE id in (6932,6966,6983);--Shield

    --Increasing Max Stack Size of Farming and Gathering Seeds, Lumber, Iron Ingot, Stone Brick
    UPDATE items SET max_stack_size = 1000 WHERE max_stack_size = 100;   

    --Fixing Afternoon Sun on Alchemy Bench
    INSERT INTO craft_pack_crafts (id, craft_pack_id, craft_id) VALUES (900100, 13, 6719);

    --Fixing Spacious Storage Chest
    UPDATE crafts SET req_doodad_id = 2240, ac_id = 66 WHERE id = 107;

    --Fixing Golden Teardrop Storage Chest
    UPDATE crafts SET req_doodad_id = 2240, ac_id = 66 WHERE id = 5689;
    UPDATE craft_products SET show_lower_crafts = 't' where craft_id = 107;

    --Making it where there are no proficeny limits
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 2;
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 3;
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 4;
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 5;
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 6;
    UPDATE expert_limits SET expert_limit = 8 WHERE id = 7;
    UPDATE expand_expert_limits SET item_count = 1;
    --INSERT INTO expand_expert_limits (id, expand_count, life_point, item_id, item_count) VALUES (15, 15, 0, 29656, 15);
    --INSERT INTO expand_expert_limits (id, expand_count, life_point, item_id, item_count) VALUES (16, 16, 0, 29656, 16);
--Server Only
    --Changing all the 10 seconds spawn times
    UPDATE npc_spawners SET spawn_delay_min = 121, spawn_delay_max = 121 WHERE spawn_delay_min = 10;  