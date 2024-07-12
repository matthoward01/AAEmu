UPDATE buffs SET duration=1000000 WHERE id = 1933
UPDATE taxations SET tax = 1 WHERE id != 1
UPDATE open_portal_inland_reagents SET amount = 0;
UPDATE open_portal_outland_reagents SET amount = 0;
UPDATE buffs SET duration = 3600000 WHERE id = '6174'
UPDATE skills SET casting_time = 1000 WHERE id IN
(10212,13726,13967,13970,13971,13972,13973,15426,16768,18772,20782,24266,25526,25527);
UPDATE skills SET casting_time = 1000 WHERE id IN
(14238,14239,14240,14241,14242);
UPDATE skills SET casting_time = 1000 WHERE id IN
(13990,13991,13992,13993,13994);
UPDATE skills SET casting_time = 1000 WHERE id IN
(13820,13821,13800,13802,13801);
UPDATE npc_spawners SET spawn_delay_min = 121, spawn_delay_max = 121 WHERE spawn_delay_min = 10;
