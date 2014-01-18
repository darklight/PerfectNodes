-- Create a new table for our code:
PN_Equips= { }
-- Some local variables we use in our module:
PN_Equips.running = false
PN_Equips.lastticks = 0
PN_Equips.itemlists = {}

-- Initializing function, we create a new Window for our module that has 1 button and 1 field to display data:
function PN_Equips.ModuleInit()
    GUI_NewWindow("PN_Equips",50,50,100,50);
    GUI_NewField("PN_Equips","HP:","hpvalue");

    GUI_NewComboBox("PN_Equips","Primary Tool","pneb_main",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Secondary Tool","pneb_scnd",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Hats","pneb_head",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Clothing","pneb_body",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Gloves","pneb_hand",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Leggings","pneb_legs",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Shoes","pneb_feet",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Earrings","pneb_ear",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Necklace","pneb_neck",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Bracelets","pneb_brce",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Ring","pneb_ring",strings[gCurrentLanguage].botany,"None")
    GUI_NewComboBox("PN_Equips","Waist","pneb_waist",strings[gCurrentLanguage].botany,"None")

    GUI_NewComboBox("PN_Equips","Primary Tool","pnem_main",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Secondary Tool","pnem_scnd",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Hats","pnem_head",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Clothing","pnem_body",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Gloves","pnem_hand",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Leggings","pnem_legs",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Shoes","pnem_feet",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Earrings","pnem_ear",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Necklace","pnem_neck",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Bracelets","pnem_brce",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Ring","pnem_ring",strings[gCurrentLanguage].mining,"None")
    GUI_NewComboBox("PN_Equips","Waist","pnem_waist",strings[gCurrentLanguage].mining,"None")

    GUI_NewButton("PN_Equips","Toggle","PN_Equips.TOGGLE");
    PN_Equips.UpdateLists()
end


function PN_Equips.UpdateLists()
    -- setup markers
    local primary = "None"
    PN_Equips.itemlists.primary = {}

    local item = Inventory("type=3500")
    if ( item) then
        for key, pos in pairs(item) do
            primary = primary..","..item.name
            PN_Equips.itemlists.primary[item.id] = item.name
        end
    end

    pneb_main_listitems = primary
    pnem_main_listitems = primary

    pneb_main = "None"
    pnem_main = "None"
end

-- The function that gets called when the button is pressed:
function PN_Equips.ToggleRun()
    PN_Equips.running = not PN_Equips.running
end

-- The Mainloop function, gets called all the time by FFXIVMinion:
function PN_Equips.OnUpdateHandler( Event, ticks )
    if ( PN_Equips.running and ticks - PN_Equips.lastticks > 500 ) then
        PN_Equips.lastticks = ticks
-- if the player is alive, set the current HP value into the new field of our created Window:
        if (Player.alive) then
            hpvalue = tostring(Player.health.current)
        end
    end
end

-- Registering the Events
RegisterEventHandler("Gameloop.Update",PN_Equips.OnUpdateHandler) -- the normal pulse from the gameloop
RegisterEventHandler("PN_Equips.TOGGLE", PN_Equips.ToggleRun) -- the function that gets called when our button is pressed
RegisterEventHandler("Module.Initalize",PN_Equips.ModuleInit) -- the initialization function, gets called only once at startup of the game