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
   local numberValue = nil

   local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

   FarmTab:CreateToggle({
      Name = "Enable Auto Farm",
      CurrentValue = false,
      Flag = "AutoFarmToggle",
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
            local args = { "Auto Race", false }
            game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer(unpack(args))
            wait(1)
            game:GetService("ReplicatedStorage").Remotes["TP"]:InvokeServer(1)
         end
      end,
   })


   FarmTab:CreateToggle({
      Name = "Auto Train",
      CurrentValue = false,
      Flag = "AutoTrainToggle",
      Callback = function(enabled)
         local args = { [1] = "Auto Train", [2] = enabled }
         game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer(unpack(args))
      end,
   })


   FarmTab:CreateToggle({
      Name = "Auto Race",
      CurrentValue = false,
      Flag = "AutoRaceToggle",
      Callback = function(enabled)
         local args = { [1] = "Auto Race", [2] = enabled }
         game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer(unpack(args))
      end,
   })


   FarmTab:CreateDropdown({
      Name = "Rebirth Option", 
      Options = { "1", "5", "20", "50", "100", "400", "1K", "5K", "25K", "75K", "200K", "500K", "2M", "25M", "100M", "1B", "50B", "500B", "50T" }, 
      CurrentOption = "1", 
      Callback = function(rebirthValue)
         if rebirthValue == "1" then numberValue = 1 
         elseif rebirthValue == "5" then numberValue = 2 
         elseif rebirthValue == "20" then numberValue = 3 
         elseif rebirthValue == "50" then numberValue = 4 
         elseif rebirthValue == "100" then numberValue = 5
         elseif rebirthValue == "400" then numberValue = 6
         elseif rebirthValue == "1K" then numberValue = 7
         elseif rebirthValue == "5K" then numberValue = 8
         elseif rebirthValue == "25K" then numberValue = 9
         elseif rebirthValue == "75K" then numberValue = 10
         elseif rebirthValue == "200K" then numberValue = 11
         elseif rebirthValue == "500K" then numberValue = 12
         elseif rebirthValue == "2M" then numberValue = 13
         elseif rebirthValue == "25M" then numberValue = 14
         elseif rebirthValue == "100M" then numberValue = 15
         elseif rebirthValue == "1B" then numberValue = 16
         elseif rebirthValue == "50B" then numberValue = 17
         elseif rebirthValue == "500B" then numberValue = 18
         elseif rebirthValue == "50T" then numberValue = 19
         else numberValue = 0
         end
      end,
   })


   FarmTab:CreateToggle({
      Name = "Auto Rebirth",
      CurrentValue = false,
      Flag = "AutoRebirthToggle",
      Callback = function(enable)
         if enable and numberValue then
            while enable do
               local args = { [1] = numberValue }
               game:GetService("ReplicatedStorage").Remotes["Rebirth"]:InvokeServer(unpack(args))
               task.wait(1)
               if not Rayfield.Flags["AutoRebirthToggle"].CurrentValue then break end
            end
         end
      end,
   })

   Rayfield:LoadConfiguration()
end
