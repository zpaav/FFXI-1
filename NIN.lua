function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
    include('Mote-TreasureHunter')
    state.TreasureMode:set('Tag')
	
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
    state.UseRune = M(false, 'Use Rune')
    state.UseWarp = M(false, 'Use Warp')
    state.Adoulin = M(false, 'Adoulin')
    state.Moving  = M(false, "moving")
    state.warned = M(false)
	
    run_sj = player.sub_job == 'RUN' or false
	
	gear.default.obi_back = "Toro Cape"
	gear.default.obi_waist = "Eschan Stone"

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan +1"
	
    select_ammo()
	gear.RegularAmmo = "Togakushi Shuriken"
    gear.SangeAmmo = "Happo Shuriken"
    options.ammo_warning_limit = 25
	
    LugraWSList = S{'Blade: Kamu', 'Blade: Hi', 'Blade: Metsu'}

    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
	
    determine_haste_group()
end

function user_setup()
    state.OffenseMode:options('Normal', 'MidAcc', 'HighAcc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'MagicBurst')
	
	send_command('bind ^f1 nin UtsusemiSan') --MX1--
	send_command('bind ^f2 nin UtsusemiNi') --MX2--
	send_command('bind ^f3 nin UtsusemiIchi') --MX3--
	send_command('bind ^f4 nin KakkaIchi') --MX4--
	send_command('bind ^f5 nin MigawariIchi') --MX5--
	
	send_command('bind ^f6 nin JubakuIchi') --MX6--
	send_command('bind ^f7 nin KurayamiNi') --MX7--
	send_command('bind ^f8 nin HojoNi') --MX8--
	send_command('bind ^f9 nin AishaIchi') --MX9--
	send_command('bind ^f10 nin YurinIchi') --MX10--
	
	send_command('bind !f1 ws BladeMetsu') --M1--
	send_command('bind !f2 ws BladeShun') --M2--
	send_command('bind !f3 ws BladeHi') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws BladeTen') --M4--
	send_command('bind !f6 ja Issekigan') --M5--
	send_command('bind !f7 ja Yonin') --M6--
	send_command('bind !f8 ja Innin') --M7--
	send_command('bind !f9 ja Sange') --M8--
	send_command('bind !f10 gs c toggle UseRune') --M9--
	send_command('bind !f11 gs c cycle Runes') --M10--
    
    select_movement_feet()
    select_default_macro_book()
end

function user_unload()
	send_command('unbind ^f1')
	send_command('unbind ^f2')
	send_command('unbind ^f3')
	send_command('unbind ^f4')
	send_command('unbind ^f5')
	send_command('unbind ^f6')
	send_command('unbind ^f7')
	send_command('unbind ^f8')
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	
	send_command('unbind !f1')
	send_command('unbind !f2')
	send_command('unbind !f3')
	--send_command('unbind !f4')
	send_command('unbind !f5')
	send_command('unbind !f6')
	send_command('unbind !f7')
	send_command('unbind !f8')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
end

function init_gear_sets()
    --------------------------------------
    -- Augments
    --------------------------------------
	
    Andartia = {}
    Andartia.TP = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    Andartia.WS = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	HerculeanHead = {}
	HerculeanHead.DW = {name="Herculean Helm", augments={'Attack+20','"Dual Wield"+4','STR+7','Accuracy+8',}}
	HerculeanHead.Nuke = {name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','Magic burst mdg.+1%','INT+14','Mag. Acc.+8',}}

	HerculeanHands = {}
	HerculeanHands.TA = {name="Herculean Gloves", augments={'Attack+25','"Triple Atk."+2','DEX+10','Accuracy+15',}}
	HerculeanHands.WS = {name="Herculean Gloves", augments={'Weapon skill damage +5%','Attack+13',}}
	
	HerculeanLegs = {}
	HerculeanLegs.DW = {name="Herculean Trousers", augments={'Accuracy+23','"Dual Wield"+5','AGI+6','Attack+14',}}
	HerculeanLegs.WSDEX = {name="Herculean Trousers", augments={'Attack+16','Weapon skill damage +3%','DEX+5',}}
	HerculeanLegs.Nuke = {name="Herculean Trousers", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+4%','STR+9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}}
	
	HerculeanFeet = {}
	HerculeanFeet.DW = {}
	HerculeanFeet.TA = {name="Herculean Boots", augments={'Attack+26','"Triple Atk."+4','AGI+7','Accuracy+11',}}
	HerculeanFeet.WSDEX = {name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}
	HerculeanFeet.WSAGI = {name="Herculean Boots", augments={'Crit.hit rate+4','AGI+8','Accuracy+11',}}
	HerculeanFeet.Nuke = {}
	
    --------------------------------------
    -- Utility sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi"}
    sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
	
    sets.Lugra = {ear1="Lugra Earring", ear2="Lugra Earring +1"}
    sets.Brutal = {ear1="Brutal Earring",ear2="Ishvara Earring"}
    sets.BrutalDEX = {ear1="Brutal Earring",ear2="Dominance Earring +1"}
	sets.IshvaraDEX = {ear1="Dominance Earring +1",ear2="Ishvara Earring"}
    sets.TreasureHunter = {waist="Chaac Belt"}
	
    sets.RegularAmmo = {ammo=gear.RegularAmmo}
    sets.SangeAmmo = {ammo=gear.SangeAmmo}

    --------------------------------------
    -- Job Abilties
    --------------------------------------
	
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    sets.precast.JA['Mikage'] = {legs="Andartia's Mantle"}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko"}
    sets.precast.JA['Sange'] = {ammo=gear.SangeAmmo, body="Mochizuki Chainmail +1"}
	sets.precast.JA['Swipe'] = {
		ammo="Seething Bomblet +1",
		head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
		back="Argochampsa Mantle",
		waist=gear.ElementalObi,
		legs=HerculeanLegs.Nuke,
		feet="Herculean Boots"}
	sets.precast.JA['Lunge'] = sets.precast.JA['Swipe']

    sets.precast.Waltz = {}

    sets.precast.Step = {waist="Chaac Belt",}
		
    sets.precast.Flourish1 = {waist="Chaac Belt"}
	
    sets.Warp = {ring1="Warp Ring"}

	sets.midcast.Trust = {}
    sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {body="Apururu Unity shirt"})

    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    sets.precast.FC = {
		ammo="Impatiens",
		head="Herculean Helm",
		neck="Jeweled Collar",
		ear1="Etiolation Earring",
		ear2="Loquacious Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon ring",
		back="Andartia's Mantle",
		waist="Ninurta's Sash",
		legs="Gyve Trousers",
		feet="Amm Greaves"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads",
		body="Mochizuki Chainmail +1",
		feet="Hattori Kyahan"})

    sets.precast.RA = {}
       
    --------------------------------------
    -- Weaponskill sets
    --------------------------------------
	
    sets.precast.WS = {}
		
    sets.precast.WS.Acc = sets.precast.WS
	
	sets.precast.WS['Blade: Metsu'] = {
		ammo="Jukukik Feather",
		head="Lilitu Headpiece",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.WS,
		ring1="Ramuh Ring +1",
		ring2="Epona's Ring",
		back=Andartia.WS,
		waist="Artful Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}

	sets.precast.WS['Blade: Kamu'] = {
		ammo="Floestone",
		head="Lilitu Headpiece",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.WS,
		ring1="Ifrit Ring",
		ring2="Spiral Ring",
		back=Andartia.WS,
		waist="Caudata Belt",
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}
		
    sets.precast.WS['Blade: Hi'] = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Ishvara Earring",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ring1="Begrudging Ring",
		ring2="Epona's Ring",
        back=Andartia.WS,
		waist="Sveltesse Gouriz +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSAGI}

    sets.precast.WS['Blade: Shun'] = {
		ammo="Jukukik Feather",
        head="Lilitu Headpiece",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Dominance Earring +1",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Ramuh Ring +1",
		ring2="Epona's Ring",
		back=Andartia.TP,
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}

    sets.precast.WS['Blade: Ten'] = {
		ammo="Seething Bomblet +1",
		head="Lilitu Headpiece",
		neck=gear.ElementalGorget,
		ear1="Dominance Earring +1",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.WS,
		ring1="Ifrit Ring",
		ring2="Epona's Ring",
		back=Andartia.WS,
		waist="Artful Belt +1",
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.WSDEX}
		
    sets.precast.WS['Evisceration'] = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Moonshade Earring",
		ear2="Dominance Earring +1",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ring1="Begrudging Ring",
		ring2="Epona's Ring",
        back=Andartia.WS,
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}
		
    sets.precast.WS['Aeolian Edge'] = {
		ammo="Seething Bomblet +1",
		head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Arvina Ringlet +1",
		ring2="Acumen Ring",
		back="Toro Cape",
		waist="Eschan Stone",
		legs=HerculeanLegs.Nuke,
		feet=HerculeanFeet.WSDEX}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC
        
    sets.midcast.Utsusemi = {back="Andartia's Mantle",feet="Hattori Kyahan"}

    sets.midcast.ElementalNinjutsu = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Acumen Ring",
		ring2="Weatherspoon Ring",
		back=gear.ElementalCape,
		waist=gear.ElementalObi,
		legs=HerculeanLegs.Nuke,
		feet="Herculean Boots"}

    sets.midcast.ElementalNinjutsu.MagicBurst = set_combine(sets.midcast.Ninjutsu, {ring1="Locus Ring",ring2="Mujin Band",})

    sets.midcast.NinjutsuDebuff = {
		ammo="Pemphredo Tathlum",
		head="Dampening Tam",
		neck="Incanter's Torque",
		ear1="Gwati Earring",
		ear2="Dignitary's Earring",
		body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Sangoma Ring",
		ring2="Weatherspoon Ring",
		back="Yokaze Mantle",
		waist="Eschan Stone",
		legs=HerculeanLegs.Nuke,
		feet="Herculean Boots"}

    --------------------------------------
    -- Idle/Resting/Defense/Etc sets
    --------------------------------------

    sets.idle = {
		ammo="Staunch Tathlum",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Mekosu. Harness",
		hands="Floral Gauntlets",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flax Sash",
		legs="Otronif Brais +1",
		feet=gear.MovementFeet}

    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Floral Gauntlets",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Otronif Brais +1",
		feet="Amm Greaves"}

    sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Mekosu. Harness",
		hands="Floral Gauntlets",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Engulfer Cape +1",
		waist="Flax Sash",
		legs="Otronif Brais +1",
		feet="Amm Greaves"}

    sets.Adoulin = {body="Councilor's Garb"}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
	
    sets.engaged = {
		ammo=sets.RegularAmmo,
		head="Ryuo Somen",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Andartia.TP,
		waist="Patentia Sash",
		legs=HerculeanLegs.DW,
		feet="Hizamaru sune-ate +1"}
    sets.engaged.MidAcc = set_combine(sets.engaged , {})
    sets.engaged.HighAcc = set_combine(sets.engaged , {})

    sets.engaged.HighHaste = {
		ammo=sets.RegularAmmo,
		head="Ryuo Somen",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Andartia.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet="Hizamaru sune-ate +1"}
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.HighHaste , {})
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.HighHaste , {})

    sets.engaged.MaxHaste = {
		ammo=sets.RegularAmmo,
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Andartia.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
	sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {})
    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {})
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if string.find(spell.english, 'Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
            cancel_spell()
            eventArgs.cancel = true
            return
        end
    end
    if spell.name == 'Sange' and player.equipment.ammo == gear.RegularAmmo then
        state.Buff.Sange = false
        eventArgs.cancel = true
    end
	if LugraWSList:contains(spell.english) then
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
		else
			equip(sets.Brutal)
		end
	elseif spell.english == 'Blade: Shun' then
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
		else
			equip(sets.BrutalDEX)
		end
	elseif spell.english == 'Blade: Ten' then
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
		else
			equip(sets.IshvaraDEX)
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

function job_buff_change(buff, gain)
    if S{'Haste','March','Embrava','Haste Samba','Mighty Guard'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Use Rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    meleeSet = set_combine(meleeSet, select_ammo())
    return meleeSet
end

function job_update(cmdParams, eventArgs)
    local res = require('resources')
    local info = windower.ffxi.get_info()
    local zone = res.zones[info.zone].name
    if state.Moving.value == true then
        if zone:match('Adoulin') then
            equip(sets.Adoulin)
        end
        equip(select_movement())
    end
    select_ammo()
    select_movement_feet()
    determine_haste_group()
    run_sj = player.sub_job == 'RUN' or false
    th_update(cmdParams, eventArgs)
end

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
		-- buffactive[580] = Geo-Haste
		-- buffactive[33] = Haste/Haste II
		-- buffactive[604] = Mighty Guard
    if buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and (buffactive[33] or buffactive[604]) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604]) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive[33] and buffactive[604] and buffactive.march then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive[33] and buffactive[604] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive[33] then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end

function select_ammo()
    if state.Buff.Sange then
        return sets.SangeAmmo
    else
        return sets.RegularAmmo
    end
end

function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                state.Moving.value = true
                send_command('gs c update')
                moving = true
            elseif dist < 1 and moving then
                state.Moving.value = false
                --send_command('gs c update')
                moving = false
            end
        end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
end)

function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end

function th_action_check(category, param)
    if category == 2 or
        (category == 3 and param == 30) or
        (category == 6 and info.default_ja_ids:contains(param)) or
        (category == 14 and info.default_u_ja_ids:contains(param))
        then 
            return true
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.type == 'Trust' then
        return 'Trust'
    end
end

function job_state_change(stateField, newValue, oldValue)
	if stateField == 'Runes' then
        local msg = ''
        if newValue == 'Ignis' then
            msg = msg .. 'Increasing resistence against ICE and deals FIRE damage.'
        elseif newValue == 'Gelus' then
            msg = msg .. 'Increasing resistence against WIND and deals ICE damage.'
        elseif newValue == 'Flabra' then
            msg = msg .. 'Increasing resistence against EARTH and deals WIND damage.'
        elseif newValue == 'Tellus' then
            msg = msg .. 'Increasing resistence against LIGHTNING and deals EARTH damage.'
        elseif newValue == 'Sulpor' then
            msg = msg .. 'Increasing resistence against WATER and deals LIGHTNING damage.'
        elseif newValue == 'Unda' then
            msg = msg .. 'Increasing resistence against FIRE and deals WATER damage.'
        elseif newValue == 'Lux' then
            msg = msg .. 'Increasing resistence against DARK and deals LIGHT damage.'
        elseif newValue == 'Tenebrae' then
            msg = msg .. 'Increasing resistence against LIGHT and deals DARK damage.'
        end
        add_to_chat(123, msg)
   -- elseif stateField == 'moving' then
   --     if state.Moving.value then
   --         local res = require('resources')
   --         local info = windower.ffxi.get_info()
   --         local zone = res.zones[info.zone].name
   --         if zone:match('Adoulin') then
   --             equip(sets.Adoulin)
   --         end
   --         equip(select_movement())
   --     end
        
    elseif stateField == 'Use Rune' then
        send_command('@input /ja '..state.Runes.value..' <me>')
    elseif stateField == 'Use Warp' then
        add_to_chat(8, '------------WARPING-----------')
        --equip({ring1="Warp Ring"})
        send_command('input //gs equip sets.Warp;@wait 10.0;input /item "Warp Ring" <me>;')
    end
end

function select_default_macro_book()
    if player.sub_job == 'DNC' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'RUN' then
        set_macro_page(3, 2)
    else
        set_macro_page(1, 2)
    end
end
