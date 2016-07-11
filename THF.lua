function get_sets()
    mote_include_version = 2
    
    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false

    state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
    state.UseRune = M(false, '')
    state.UseWarp = M(false, 'Use Warp')
    state.Adoulin = M(false, 'Adoulin')
    state.Moving  = M(false, "moving")

    run_sj = player.sub_job == 'RUN' or false
	
    include('Mote-TreasureHunter')

    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

function user_setup()
    state.OffenseMode:options('Normal', 'MidAcc', 'HighAcc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')

    send_command('bind ^` ja Flee')
    send_command('bind ^= gs c cycle treasuremode')
	send_command('bind f4 ws RudrasStorm')
	send_command('bind f5 ja Mug')
	send_command('bind ^f5 ja Steal')
	send_command('bind !f5 ja Despoil')
	send_command('bind f6 ja Conspirator')
	send_command('bind f7 ja Bully')

	send_command('bind ^f1 ma UtsusemiNi') --MX1--
	send_command('bind ^f2 ma UtsusemiIchi') --MX2--
	send_command('bind ^f3 input //sneakattack;wait 1; //RudrasStorm') --MX3--
	send_command('bind ^f4') --MX4--
	send_command('bind ^f5') --MX5--
	
	send_command('bind ^f6 ja Bully') --MX6--
	send_command('bind ^f7') --MX7--
	send_command('bind ^f8') --MX8--
	send_command('bind ^f9') --MX9--
	send_command('bind ^f10') --MX10--
	
	send_command('bind !f1') --M1--
	send_command('bind !f2') --M2--
	send_command('bind !f3') --M3--
	--send_command('bind !f4')
	send_command('bind !f5') --M4--
	
	send_command('bind !f6') --M5--
	send_command('bind !f7') --M6--
	send_command('bind !f8') --M7--
	send_command('bind !f9') --M8--
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
end

function init_gear_sets()
    --------------------------------------
    -- Augments
    --------------------------------------
	
	Toutatis = {}
    Toutatis.TP = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    Toutatis.WS = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	HerculeanHead = {}
	HerculeanHead.DW = {}
	HerculeanHead.WS = {}
	HerculeanHead.Nuke = {name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','Magic burst mdg.+1%','INT+14','Mag. Acc.+8',}}

	HerculeanHead = {}
	HerculeanHead.DW = {name="Herculean Helm", augments={'Attack+20','"Dual Wield"+4','STR+7','Accuracy+8',}}
	HerculeanHead.Nuke = {name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','Magic burst mdg.+1%','INT+14','Mag. Acc.+8',}}

	HerculeanHands = {}
	HerculeanHands.TA = {name="Herculean Gloves", augments={'Attack+25','"Triple Atk."+2','DEX+10','Accuracy+15',}}
	HerculeanHands.WS = {name="Herculean Gloves", augments={'Weapon skill damage +5%','Attack+13',}}
	
	HerculeanLegs = {}
	HerculeanLegs.DW = {name="Herculean Trousers", augments={'Accuracy+23','"Dual Wield"+5','AGI+6','Attack+14',}}
	HerculeanLegs.Nuke = {name="Herculean Trousers", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+4%','STR+9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}}
	
	HerculeanFeet = {}
	HerculeanFeet.DW = {name="Herculean Boots", augments={'Accuracy+24','"Dual Wield"+5','AGI+1','Attack+6',}}
	HerculeanFeet.TA = {name="Herculean Boots", augments={'Attack+26','"Triple Atk."+4','AGI+7','Accuracy+11',}}
	HerculeanFeet.WSDEX = {name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}
	HerculeanFeet.WSAGI = {}
	HerculeanFeet.Nuke = {}
	
    --------------------------------------
    -- Utility sets
    --------------------------------------
	
    sets.TreasureHunter = {hands="Plunderer's Armlets +1",feet="Skulker's Poulaines"}

    sets.buff['Sneak Attack'] = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck="Moepapa Medal",
		ear1="Cessance Earring",
		ear2="Dominance Earring +1",
		body="Abnoba Kaftan",
		hands="Skulker's Armlets",
		ring1="Ramuh Ring +1",
		ring2="Rajas Ring",
		back="Toutatis'S Cape",
		waist="Artful Belt +1",
		legs="Pillager's Culottes +1",
		feet={ name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}}
    sets.buff['Trick Attack'] = set_combine(sets.buff['Sneak Attack'], {
		hands="Pillager's Armlets +1",
		ring1="Garuda Ring +1",
		back="Canny Cape",
		waist="Sveltesse Gouriz +1",
		feet={ name="Herculean Boots", augments={'Attack+26','"Triple Atk."+4','AGI+7','Accuracy+11',}}})

    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Job Abilties
    --------------------------------------
	
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"}
    sets.precast.JA['Steal'] = {legs="Pillager's Culottes +1"}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulker's Poulaines"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {legs="Plunderer's Culottes +1"}
	sets.precast.JA['Mug'] = {
		ammo="Expeditious Pinion",
		head="Imperial Wing Hairpin",
		neck="Moepapa Medal",
		ear1="Suppanomimi",
		ear2="Dominance Earring +1",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Ramuh Ring +1",
		ring2="Garuda Ring +1",
		back="Kayapa Cape",
		waist="Artful Belt +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    sets.precast.Waltz = {}

    sets.precast.Waltz['Healing Waltz'] = {}

    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    sets.precast.FC = {
		ammo="Impatiens",
		head="Herculean Helm",
		neck="Jeweled Collar",
		ear1="Loquacious Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
		back="",
		waist="",
		legs="",
		feet=""}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    sets.precast.RA = {}

    sets.precast.WS = {}

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'], {})

    sets.precast.WS['Evisceration'] = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Moonshade Earring",
		ear2="Dominance Earring +1",
		body="Abnoba Kaftan",
		hands="Adhemar Wristbands",
		ring1="Begrudging Ring",
		ring2="Ramuh Ring +1",
        back="Kayapa Cape",
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Crit.hit rate+4','AGI+8','Accuracy+11',}}}
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'], {back="Toutatis'S Cape"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'], {})

    sets.precast.WS["Rudra's Storm"] = {
		ammo="Jukukik Feather",
		head="Lilitu Headpiece",
		neck="Moepapa Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Ramuh Ring +1",
		ring2="Apate Ring",
		back="Kayapa Cape",
		waist="Artful Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Abnoba Kaftan",
		back="Toutatis's Cape"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Abnoba Kaftan",})

    sets.precast.WS['Aeolian Edge'] = {
		ammo="Seething Bomblet +1",
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+21','Magic burst mdg.+1%','INT+14','Mag. Acc.+8',}},
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Samnuha Coat",
		hands="Pursuer's Cuffs",
		ring1="Arvina Ringlet +1",
		ring2="Acumen Ring",
		back="Argochampsa Mantle",
		waist="Eschan Stone",
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+4%','STR+9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}},
		feet={ name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}}
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)
	
	sets.precast.WS['Cyclone'] = set_combine(sets.precast.WS['Aeolian Edge'], {})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Utsusemi = sets.precast.FC
	
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    sets.resting = {}
	
    sets.idle = {
		ammo="Staunch Tathlum",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Mujin Stud",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Dark Ring",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}
    sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = set_combine(sets.idle, {})

    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Dark Ring",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Herculean Boots"}

    sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Merman's Earring",
		ear2="Mujin Stud",
		body="Samnuha Coat",
		hands="Floral Gauntlets",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Engulfer Cape +1",
		waist="Flax Sash",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}

    --------------------------------------
    -- Melee sets
    --------------------------------------

    sets.engaged = {
		ammo="Ginsen",
		head=HerculeanHead.DW,
		neck="Erudit. Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Canny Cape",
		waist="Patentia Sash",
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.WSDEX}
    sets.engaged.MidAcc = set_combine(sets.engaged, {
		ammo="Falcon Eye",
		ring2="Ramuh Ring +1"})
	sets.engaged.HighAcc = {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Erudit. Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Ramuh Ring +1",
		ring2="Mars's Ring",
		back="Canny Cape",
		waist="Kentarch Belt +1",
		legs="Herculean Trousers",
		feet={name="Taeon Boots", augments={'Accuracy+18 Attack+18','"Dual Wield"+5','STR+9',}}}

    sets.engaged.HighHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Canny Cape",
		waist="Patentia Sash",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.HighHaste, {
		ammo="Falcon Eye",
		head="Dampening Tam",
		ring2="Ramuh Ring +1"})
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.HighAcc)

    sets.engaged.MaxHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Rawhide Vest", --Adhemar Jacket
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Canny Cape", --Toutatis.TP
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
    sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
		ammo="Falcon Eye",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1"})
    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.HighAcc)
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
    check_buff('Feint', eventArgs)
end

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_range_lock()

    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end

function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    return meleeSet
end

function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
    determine_haste_group()
end

function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

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
        then return true
    end
end

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['mighty guard'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.haste and buffactive['mighty guard'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.haste then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end

function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end

function select_default_macro_book()
    if player.sub_job == 'DNC' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 3)
    else
        set_macro_page(1, 3)
    end
end
