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
    (10212,13726,13967,13970,13971,13972,13973,15426,16768,18772,20782,24266,25526,25527);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (14238,14239,14240,14241,14242);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (13990,13991,13992,13993,13994);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (13820,13821,13800,13802,13801);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (13980,13981,13982,13983,13984);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (14581,14604,14605,14606,14607,21906,22477,22683);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (11096,14579,14614,14615,14616,14617,21582,22684);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (11081,14582,14608,14611,14612,14613,22373,22682);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (23293,23294,23295,23596,23597,23481,23482);
    UPDATE skills SET casting_time = 1000 WHERE id IN
    (14618,14619,14620,14621,22680);
    UPDATE skills SET casting_time = 1000 WHERE id >= 26032 AND id <= 26109;
    UPDATE skills SET casting_time = 1000 WHERE id >= 26001 AND id <= 26009;
    UPDATE skills SET casting_time = 1000 WHERE id >= 25414 AND id <= 25493 AND id != 25415;

    --Updating Red Regrade Charm
    UPDATE item_grade_enchanting_supports SET add_success_mul = 10000, add_great_success_ratio = 100, add_great_success_mul = 1000,
    add_break_ratio = -10000, add_downgrade_ratio = -10000 WHERE item_id = 31977

    --Adding Gilda Stars to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9000002, 164, 23633, 1);
    UPDATE items SET living_point_price = 500 WHERE id = 23633;

    --Adding Minning Drill to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9000002, 164, 34779, 1);
    UPDATE items SET living_point_price = 2000 WHERE id = 34779;

    --Adding Fishing Pond to Vocation Merchant
    INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9000003, 164, 34778, 1);
    UPDATE items SET living_point_price = 2000 WHERE id = 34778;

    --Farm Wagon
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('17945', '4107', '19472', '1', 'f', '-1');
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('17947', '4107', '19468', '4', 'f', '-1');
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('17948', '4107', '19469', '1', 'f', '-1');
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('17949', '4107', '19470', '1', 'f', '-1');
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('17950', '4107', '23722', '1', 'f', '-1');
    INSERT INTO "main"."craft_materials" ("id", "craft_id", "item_id", "amount", "main_grade", "require_grade") VALUES ('8000230', '4107', '36293', '1', 'f', '-1');

    INSERT INTO "main"."crafts" ("id", "title", "cast_delay", "tool_id", "skill_id", "wi_id", "desc", "milestone_id", "req_doodad_id", "need_bind", "ac_id", "actability_limit", "show_upper_crafts", "recommend_level", "visible_order", "translate") VALUES ('4105', '고출력 동력 기관', '10000', '0', '15618', '40', '', '5', '532', 'f', '27', '0', 'f', '0', '2', 't');
    delete from crafts where id = 4105 AND req_doodad_id is null
    INSERT INTO "main"."crafts" ("id", "title", "cast_delay", "tool_id", "skill_id", "wi_id", "desc", "milestone_id", "req_doodad_id", "need_bind", "ac_id", "actability_limit", "show_upper_crafts", "recommend_level", "visible_order", "translate") VALUES ('5327', '달구지용 물통', '10000', '0', '15617', '40', '', '5', '532', 'f', '27', '0', 'f', '0', '1', 't');
    delete from crafts where id = 5327 AND req_doodad_id is null
    INSERT INTO "main"."crafts" ("id", "title", "cast_delay", "tool_id", "skill_id", "wi_id", "desc", "milestone_id", "req_doodad_id", "need_bind", "ac_id", "actability_limit", "show_upper_crafts", "recommend_level", "visible_order", "translate") VALUES ('4103', '튼튼한 바퀴', '10000', '0', '15618', '40', '', '5', '532', 'f', '27', '0', 'f', '0', '2', 't');
    delete from crafts where id = 4103 AND req_doodad_id is null

    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24 WHERE id=4107; --Farm Wagon
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24 WHERE id=6029; --Farm Hauler
    UPDATE "main"."crafts" SET req_doodad_id=532, ac_id=24 WHERE id=6913; --Red Farm Hauler

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

--Server Only
    --Changing all the 10 seconds spawn times
    UPDATE npc_spawners SET spawn_delay_min = 121, spawn_delay_max = 121 WHERE spawn_delay_min = 10;