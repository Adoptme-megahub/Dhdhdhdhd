if game.PlaceId == 111130915266245 then
   local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
   local Window = Rayfield:CreateWindow({
      Name = "Symbiote Hub - Race Training v1",
      Icon = 0,
      LoadingTitle = "Symbiote Hub",
      LoadingSubtitle = "by cypruxy",
      Theme = "Ocean",
      DisableRayfieldPrompts = false,
      DisableBuildWarnings = false,
      ConfigurationSaving = { Enabled = true, FolderName = "Car Training Folder (script)", FileName = "Symbiote (script)" },
      Discord = { Enabled = true, Invite = "ffJj5ap6rx", RememberJoins = true },
      KeySystem = true,
      KeySettings = { Title = "Symbiote Register", Subtitle = "Key System", Note = "Try: GoatCypruxy", FileName = "Symbiote (key)", SaveKey = true, GrabKeyFromSite = false, Key = {"GoatCypruxy"} }
   })

   local running = false

   Window:CreateTab("Auto Farm", 4483362458):CreateToggle({
      Name = "Enable Auto Farm",
      CurrentValue = false,
      Flag = "Toggle1",
      Callback = function(Value)
         running = Value
         if running then
            while running do
               game:GetService("ReplicatedStorage").Remotes["Join Race"]:FireServer()
               wait(1)
               game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer("Auto Race", true)
               wait(1)
               if not running then break end
            end
         else
            game:GetService("ReplicatedStorage").Remotes["TP"]:InvokeServer(1)
         end
      end,
   })

   Rayfield:LoadConfiguration()
end
