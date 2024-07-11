﻿using System.Drawing;
using AAEmu.Game.Core.Managers;
using AAEmu.Game.Core.Managers.Id;
using AAEmu.Game.Core.Managers.World;
using AAEmu.Game.Core.Managers.UnitManagers;
using AAEmu.Game.Models.Game;
using AAEmu.Game.Models.Game.Char;
using AAEmu.Game.Models.Game.DoodadObj;
using AAEmu.Game.Models.Game.NPChar;
using AAEmu.Game.Utils;
using System.Globalization;
using AAEmu.Game.Models.Game.Chat;
using AAEmu.Game.Utils.Scripts;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using System;

namespace AAEmu.Game.Scripts.Commands;

public class Spawn : ICommand
{
    // Unused protected static Logger Logger = LogManager.GetCurrentClassLogger();
    public void OnLoad()
    {
        CommandManager.Instance.Register("spawn", this);
    }

    public string GetCommandLineHelp()
    {
        return "<npc||doodad||remove||create> <unitId> [rotationZ]";
    }

    public string GetCommandHelpText()
    {
        return "Spawns a npc or doodad using <unitId> as a template. Or remove a doodad";
    }

    public void Execute(Character character, string[] args, IMessageOutput messageOutput)
    {
        if (args.Length < 2)
        {
            character.SendMessage("[Spawn] " + CommandManager.CommandPrefix + "spawn <npc||doodad||remove||create> <unitId> [rotationZ]");
            return;
        }

        if (uint.TryParse(args[1], out var unitId))
        {
            // character.SendMessage("[Spawn] Arg 0 --- {0} Arg 1 {1}", args[0], args[1]);

            float angle;
            using var charPos = character.Transform.CloneDetached();
            switch (args[0])
            {
                case "remove":
                    var myDoodad = WorldManager.Instance.GetDoodad(unitId);

                    if ((myDoodad != null) && (myDoodad is Doodad))
                    {
                        character.SendMessage($"[Spawn] Removing Doodad with ID {myDoodad.ObjId}");
                        ObjectIdManager.Instance.ReleaseId(myDoodad.ObjId);
                        myDoodad.Delete();
                    }
                    else
                    {
                        character.SendMessage(ChatType.System, $"[Spawn] Doodad with Id {unitId} Does not exist", Color.Red);
                    }
                    break;
                case "npc":
                    if (!NpcManager.Instance.Exist(unitId))
                    {
                        character.SendMessage(ChatType.System, $"[Spawn] NPC {unitId} don't exist|r", Color.Red);
                        return;
                    }
                    var npcSpawner = new NpcSpawner();
                    npcSpawner.Id = 0;
                    npcSpawner.UnitId = unitId;
                    charPos.Local.AddDistanceToFront(3f);
                    angle = (float)MathUtil.CalculateAngleFrom(charPos, character.Transform);
                    npcSpawner.Position = charPos.CloneAsSpawnPosition();

                    if ((args.Length > 2) && (float.TryParse(args[2], NumberStyles.Float, CultureInfo.InvariantCulture, out var newRotZ)))
                    {
                        angle = newRotZ.DegToRad();
                        character.SendMessage($"[Spawn] NPC {unitId} using angle {newRotZ}° = {angle} rad");
                    }
                    else
                    {
                        angle = angle.DegToRad();
                        character.SendMessage($"[Spawn] NPC {unitId} facing you using angle {angle} rad");
                    }
                    npcSpawner.Position.Yaw = angle;
                    npcSpawner.Position.Pitch = 0;
                    npcSpawner.Position.Roll = 0;
                    SpawnManager.Instance.AddNpcSpawner(npcSpawner);

                    npcSpawner.SpawnAll();
                    // character.SendMessage("[Spawn] NPC {0} spawned with angle {1}", unitId, angle);
                    break;
                case "create":
                    var targetUnit = character.CurrentTarget;
                    if (targetUnit != null)
                    {
                        unitId = targetUnit.TemplateId;
                    }
                    if (!NpcManager.Instance.Exist(unitId))
                    {
                        character.SendMessage(ChatType.System, $"[Spawn] NPC {unitId} don't exist|r", Color.Red);
                        return;
                    }
                    var newNpcSpawner = new NpcSpawner();
                    newNpcSpawner.Id = 0;
                    newNpcSpawner.UnitId = unitId;
                    charPos.Local.AddDistanceToFront(3f);
                    angle = (float)MathUtil.CalculateAngleFrom(charPos, character.Transform);
                    newNpcSpawner.Position = charPos.CloneAsSpawnPosition();

                    if ((args.Length > 2) && (float.TryParse(args[2], NumberStyles.Float, CultureInfo.InvariantCulture, out var newSpawnerRotZ)))
                    {
                        angle = newSpawnerRotZ.DegToRad();
                        character.SendMessage($"[Spawn] NPC {unitId} using angle {newSpawnerRotZ}° = {angle} rad");
                    }
                    else
                    {
                        angle = angle.DegToRad();
                        character.SendMessage($"[Spawn] NPC {unitId} facing you using angle {angle} rad");
                    }
                    newNpcSpawner.Position.Yaw = angle;
                    newNpcSpawner.Position.Pitch = 0;
                    newNpcSpawner.Position.Roll = 0;
                    int.TryParse(unitId.ToString(), out int id);
                    CreateSpawnJson(id, newNpcSpawner.Position.X, newNpcSpawner.Position.Y, newNpcSpawner.Position.Z, angle);
                    SpawnManager.Instance.AddNpcSpawner(newNpcSpawner);

                    newNpcSpawner.SpawnAll();
                    break;
                case "doodad":
                    if (!DoodadManager.Instance.Exist(unitId))
                    {
                        character.SendMessage(ChatType.System, $"[Spawn] Doodad {unitId} don't exist", Color.Red);
                        return;
                    }
                    var doodadSpawner = new DoodadSpawner();
                    doodadSpawner.Id = 0;
                    doodadSpawner.UnitId = unitId;
                    charPos.Local.AddDistanceToFront(3f);
                    angle = (float)MathUtil.CalculateAngleFrom(charPos, character.Transform);
                    doodadSpawner.Position = charPos.CloneAsSpawnPosition();
                    //(newX, newY) = MathUtil.AddDistanceToFront(3f, character.Transform.World.Position.X, character.Transform.World.Position.Y, character.Transform.World.Rotation.Z);
                    //doodadSpawner.Position.Y = newY;
                    //doodadSpawner.Position.X = newX;
                    //angle = (float)MathUtil.CalculateAngleFrom(doodadSpawner.Position.Y, doodadSpawner.Position.X, character.Transform.World.Position.Y, character.Transform.World.Position.X);
                    if ((args.Length > 2) && (float.TryParse(args[2], NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out var degrees)))
                    {
                        angle = degrees.DegToRad();
                        character.SendMessage($"[Spawn] Doodad {unitId} using user provided angle {degrees}° = {angle} rad");
                    }
                    else
                    {
                        angle = angle.DegToRad();
                        character.SendMessage($"[Spawn] Doodad {unitId} facing you, using characters angle {angle}");
                    }
                    doodadSpawner.Position.Yaw = angle;
                    doodadSpawner.Position.Pitch = 0;
                    doodadSpawner.Position.Roll = 0;
                    doodadSpawner.Spawn(0, 0, character.ObjId);
                    break;
            }
        }
        else
            character.SendMessage("|cFFFF0000[Spawn] Throw parse unitId|r");
    }

    public void CreateSpawnJson(int unitId, double x, double y, double z, double angle)
    {
        string jsonFileName = Path.Combine("Data", "Worlds", "main_world", "NewSpawns.json");
        string jsonFileName2 = Path.Combine("bin", "Debug", "net8.0", "Data", "Worlds", "main_world", "NewSpawns.json");
        List<SpawnUnit> units;
        if (File.Exists(jsonFileName))
        {
            string existingJson = File.ReadAllText(jsonFileName);
            units = JsonConvert.DeserializeObject<List<SpawnUnit>>(existingJson) ?? new List<SpawnUnit>();
        }
        else
        {
            units = new List<SpawnUnit>();
        }

        // Create the new unit
        var newUnit = new SpawnUnit
        {
            UnitId = unitId,
            Position = new SpawnUnitPosition
            {
                X = x,
                Y = y,
                Z = z
            }
        };

        units.Add(newUnit);

        // Serialize the list to JSON
        string json = JsonConvert.SerializeObject(units, Formatting.Indented);

        // Write the JSON to the file
        File.WriteAllText(jsonFileName, json);
        File.WriteAllText(jsonFileName2, json);
    }
}    

public class SpawnUnit
{
    public int UnitId { get; set; }
    public SpawnUnitPosition Position { get; set; }
}

public class SpawnUnitPosition
{
    public double X { get; set; }
    public double Y { get; set; }
    public double Z { get; set; }
}
