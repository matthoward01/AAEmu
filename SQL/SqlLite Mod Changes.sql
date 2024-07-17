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
    (14618,14619,14620,14621,22680);
    UPDATE skills SET casting_time = 1000 WHERE id >= 26032 AND id <= 26109;


    --Adding Gilda Stars to Vocation Merchant
    --INSERT INTO merchant_goods (id, merchant_pack_id, item_id, grade_id) VALUES (9000001, 164, 23633, 1);
    --UPDATE items SET living_point_price = 500 WHERE id = 23633;

--Server Only
    --Changing all the 10 seconds spawn times
    --UPDATE npc_spawners SET spawn_delay_min = 121, spawn_delay_max = 121 WHERE spawn_delay_min = 10;

    --Fixing First 5 Levels of Coin Purses
    UPDATE loots SET loot_pack_id = 11130 WHERE id = 346;
    UPDATE loots SET loot_pack_id = 11131 WHERE id = 347;
    UPDATE loots SET loot_pack_id = 11132 WHERE id = 348;
    UPDATE loots SET loot_pack_id = 11133 WHERE id = 349;
    UPDATE loots SET loot_pack_id = 11134 WHERE id = 350;