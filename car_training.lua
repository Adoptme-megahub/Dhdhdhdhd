if game.PlaceId==111130915266245 then local a=loadstring(game:HttpGet('https://sirius.menu/rayfield'))()local b=a:CreateWindow({Name="Symbiote Hub - Race Training v1",Icon=0,LoadingTitle="Symbiote Hub",LoadingSubtitle="by cypruxy",Theme="Ocean",DisableRayfieldPrompts=false,DisableBuildWarnings=false,ConfigurationSaving={Enabled=true,FolderName="Car Training Folder (script)",FileName="Symbiote (script)"},Discord={Enabled=true,Invite="ffJj5ap6rx",RememberJoins=true},KeySystem=true,KeySettings={Title="Symbiote Register",Subtitle="Key System",Note="Try: GoatCypruxy",FileName="Symbiote (key)",SaveKey=true,GrabKeyFromSite=false,Key={"GoatCypruxy"}}})local c=false;local d=nil;local e=b:CreateTab("Auto Farm",4483362458)e:CreateToggle({Name="Auto Race",CurrentValue=false,Flag="AutoRaceToggle",Callback=function(f)c=f;if c then while c do game:GetService("ReplicatedStorage").Remotes["Join Race"]:FireServer()wait(1)game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer("Auto Race",true)wait(1)if not c then break end end else game:GetService("ReplicatedStorage").Remotes["Set Stat"]:FireServer("Auto Race",false)game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Leave Race"):FireServer()wait(1)game:GetService("ReplicatedStorage").Remotes["TP"]:InvokeServer(1)end end})e:CreateDropdown({Name="Rebirth Option",Options={"1","5","20","50","100","400","1K","5K","25K","75K","200K","500K","2M","25M","100M","1B","50B","500B","50T"},CurrentOption="1",Callback=function(g)d=tonumber(g)end})FarmTab:CreateToggle({Name="Auto Rebirth",CurrentValue=false,Flag="AutoRebirthToggle",Callback=function(h)while h and rebirthValue do local i={rebirthValue}local j,k=pcall(function()return game:GetService("ReplicatedStorage").Remotes["Rebirth"]:InvokeServer(unpack(i))end)if not j then warn("Failed to rebirth:",k)end;task.wait(1)if not Rayfield.Flags["AutoRebirthToggle"].CurrentValue then break end end end})a:LoadConfiguration()end
