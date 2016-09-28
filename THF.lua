function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
end

function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false

    include('Mote-TreasureHunter')
    determine_haste_group()

    state.CapacityMode = M(false, 'Capacity Point Mantle')

    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Normal','Mid','Acc')
    state.IdleMode:options('Normal')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT','Evasion')
    state.MagicalDefenseMode:options('MDT')
    state.RangedMode:options('Normal')

	send_command('bind ^f1 ja Mug') --MX1--
	send_command('bind ^f2 ja Bully') --MX2--
	send_command('bind ^f3 ja Despoil') --MX3--
	send_command('bind ^f4 ja Steal') --MX4--
	send_command('bind ^f5 ja Feint') --MX5--
	send_command('bind ^f6 ja Accomplice st') --MX6--
	send_command('bind ^f7 ja Conspirator') --MX7--
	send_command('bind ^f8') --MX8--
	send_command('bind ^f9 ja Flee') --MX9--
	send_command('bind ^f10 input //berserk;wait 1;//aggressor') --MX10--
	
	send_command('bind !f1 ws RudrasStorm') --M1--
	send_command('bind !f2 input //sneakattack;wait 1;//RudrasStorm') --M2--
	send_command('bind !f3 input //trickattack;wait 1;//RudrasStorm') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws Evisceration') --M4--
	send_command('bind !f6 ws MandalicStab') --M5--
	send_command('bind !f7 ws AerolianEdge') --M6--
	send_command('bind !f8 input //sneakattack;wait 1;//MandalicStab') --M7--
	send_command('bind !f9 input //trickattack;wait 1;//MandalicStab') --M8--
	send_command('bind !f10 gs c cycle treasuremode') --M9--
	send_command('bind !f11') --M10--

    select_default_macro_book()
end

function file_unload()
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

	Toutatis = {}
    Toutatis.TP = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
    Toutatis.WS = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	HerculeanHead = {}
	HerculeanHead.FC = {name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+2','MND+5','Mag. Acc.+11','"Mag.Atk.Bns."+7',}}
	HerculeanHead.DW = {name="Herculean Helm", augments={'Attack+11','"Dual Wield"+5','DEX+4','Accuracy+11',}}
	HerculeanHead.Nuke = {name="Herculean Helm", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+2','MND+5','Mag. Acc.+11','"Mag.Atk.Bns."+7',}}
	HerculeanHead.DEXWS = {name="Herculean Helm", augments={'Attack+17','Weapon skill damage +5%','DEX+9',}}
	HerculeanHead.CritDEX = {name="Herculean Helm", augments={'Accuracy+24 Attack+24','Crit. hit damage +4%','DEX+8','Attack+12',}}
	
	HerculeanBody = {}
	HerculeanBody.TA = {name="Herculean Vest", augments={'Accuracy+30','"Triple Atk."+3',}}
	HerculeanBody.STRWS = {name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +3%','STR+10','Attack+10',}}

	HerculeanHands = {}
	HerculeanHands.TA = {name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+3','DEX+10','Attack+7',}}
	HerculeanHands.DEXWS = {name="Herculean Gloves", augments={'Attack+12','Weapon skill damage +4%','DEX+7','Accuracy+9',}}
	HerculeanHands.STRWS = {name="Herculean Gloves", augments={'Accuracy+29','Weapon skill damage +2%','STR+10','Attack+6',}}
	HerculeanHands.CritDEX = {name="Herculean Gloves", augments={'Rng.Acc.+16','Crit.hit rate+3','DEX+10','Accuracy+7','Attack+8',}}
	
	HerculeanLegs = {}
	HerculeanLegs.DW = {name="Herculean Trousers", augments={'Accuracy+23','"Dual Wield"+5','AGI+6','Attack+14',}}
	HerculeanLegs.Nuke = {name="Herculean Trousers", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst mdg.+1%','STR+9','Mag. Acc.+13','"Mag.Atk.Bns."+12',}}
	
	HerculeanFeet = {}
	HerculeanFeet.DW = {name="Herculean Boots", augments={'Accuracy+24','"Dual Wield"+5','AGI+1','Attack+6',}}
	HerculeanFeet.TA = {name="Herculean Boots", augments={'Accuracy+22 Attack+22','"Triple Atk."+3','Accuracy+7',}}
	HerculeanFeet.DEXWS = {name="Herculean Boots", augments={'Accuracy+27','Weapon skill damage +2%','DEX+11','Attack+14',}}
	HerculeanFeet.STRWS = {name="Herculean Boots", augments={'Weapon skill damage +4%','STR+8','Accuracy+12','Attack+2',}}
	HerculeanFeet.CritAGI = {name="Herculean Boots", augments={'Accuracy+21','Crit.hit rate+4','AGI+15',}}
	
	AdhemarHands = {}
	AdhemarHands.B = {name="Adhemar Wristbands", augments={'STR+10','DEX+10','Attack+15',}}
	AdhemarHands.C = {name="Adhemar Wristbands", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}}
	
    --------------------------------------
    -- Utility Sets
    --------------------------------------
	
    sets.TreasureHunter = {hands="Plunderer's Armlets +1",feet="Skulker's Poulaines"}
    sets.ExtraRegen = {}
    sets.CapacityMantle = {back="Mecistopins Mantle"}

    --------------------------------------
    -- Job Abilties Sets
    --------------------------------------

    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"}
    sets.precast.JA['Steal'] = {head="Plunderer's Bonnet"}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulker's Poulaines"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {hands="Plunderer's Armlets +1",legs="Plunderer's Culottes +1"}
    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']
	sets.precast.JA['Mug'] = {
		ammo="Expeditious Pinion",
		head="Imperial Wing Hairpin +1",
		neck="Moepapa Medal",
		ear1="Dominance Earring +1",
		ear2="Infused Earring",
		body="Meghanada Cuirie +1",
		hands="Meghanada Gloves +1",
		ring1="Garuda Ring +1",
		ring2="Ramuh Ring +1",
		back=Toutatis.TP,
		waist="Chaac Belt",
		legs="Samnuha Tights",
		feet=HerculeanFeet.DEXWS}
    sets.precast.Waltz = {}
    sets.precast.Step = {}
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter
	
    --------------------------------------
    -- Idle Sets
    --------------------------------------

    sets.idle = {
		ammo="Staunch Tathlum",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}
	sets.idle.Town = sets.idle
	sets.idle.Regen = sets.idle
	sets.idle.Weak = sets.idle

    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    sets.precast.FC = {}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
    sets.precast.RA = {}

    --------------------------------------
    -- Midcast Sets
    --------------------------------------
	
	sets.midcast.FastRecast = sets.precast.FC
	sets.midcast.Utsusemi = sets.precast.FC
    sets.midcast.RA = {}
	sets.midcast.RA.Acc = sets.midcast.RA
	sets.midcast.RA.TH = set_combine(sets.midcast.RA, set.TreasureHunter)

	--------------------------------------
	-- Engaged Sets
	--------------------------------------

	sets.engaged = {
		ammo="Ginsen",
		head="Adhemar Bonnet", --head=HerculeanHead.DW,
		neck="Erudit. Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands="Floral Gauntlets",
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back="Canny Cape",
		waist="Patentia Sash",
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
	sets.engaged.Acc = set_combine(sets.engaged.Mid, {
		ammo="Falcon Eye",
		head="Dampening Tam",
		ear2="Dignitary's Earring",
		hands=HerculeanHands.STRWS,
		ring1="Begrudging Ring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		feet=HerculeanFeet.DEXWS})
	sets.engaged.Evasion = set_combine(sets.engaged, {})
	sets.engaged.Acc.Evasion = set_combine(sets.engaged.Evasion, {})
	sets.engaged.PDT = set_combine(sets.engaged, {})
	sets.engaged.Acc.PDT = set_combine(sets.engaged.PDT, {})

	sets.engaged.MidHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Cessance Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=Toutatis.TP,
		waist="Patentia Sash",
		legs="Samnuha Tights",
		feet=HerculeanFeet.DW}
	sets.engaged.Acc.MidHaste = set_combine(sets.engaged.MidHaste, {
		ammo="Falcon Eye",
		head="Dampening Tam",
		ear2="Dignitary's Earring",
		hands=HerculeanHands.STRWS,
		ring1="Begrudging Ring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		feet=HerculeanFeet.DEXWS})
	sets.engaged.Evasion.MidHaste = set_combine(sets.engaged.MidHaste, {})
	sets.engaged.PDT.MidHaste = set_combine(sets.engaged.MidHaste, {})

	sets.engaged.MaxHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=Toutatis.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
	sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
		ammo="Falcon Eye",
		head="Dampening Tam",
		ear2="Dignitary's Earring",
		hands=HerculeanHands.STRWS,
		ring1="Begrudging Ring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		feet=HerculeanFeet.DEXWS})
	sets.engaged.Evasion.MaxHaste = set_combine(sets.engaged.MaxHaste, {})
	sets.engaged.PDT.MaxHaste = set_combine(sets.engaged.MaxHaste, {})

    --------------------------------------
    -- Weaponskill sets
    --------------------------------------
	
    sets.precast.WS = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    sets.precast.WS["Rudra's Storm"] = {
		ammo="Jukukik Feather",
		head=HerculeanHead.DEXWS,
		neck="Caro Necklace",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="Meghanada Gloves +1",
		ring1="Apate Ring",
		ring2="Ramuh Ring +1",
		back=Toutatis.WS,
		waist="Grunfeld Rope",
		legs="Lustratio Subligar",
		feet=HerculeanFeet.DEXWS}
    sets.precast.WS["Rudra's Storm"].Mid = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
		
    sets.precast.WS["Mandalic Stab"] = {
		ammo="Jukukik Feather",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="Meghanada Gloves +1",
		ring1="Apate Ring",
		ring2="Ramuh Ring +1",
		back=Toutatis.WS,
		waist="Grunfeld Rope",
		legs="Lustratio Subligar",
		feet=HerculeanFeet.DEXWS}
    sets.precast.WS["Mandalic Stab"].Mid = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Mid, {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		body="Meghanada Cuirie +1"})
		
    sets.precast.WS['Evisceration'] = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Abnoba Kaftan",
		hands=AdhemarHands.B,
		ring1="Begrudging Ring",
		ring2="Ramuh Ring +1",
		back=Toutatis.WS,
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet=HerculeanFeet.DEXWS}
    sets.precast.WS['Evisceration'].Mid = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mid, {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mid, {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mid, {})
	
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Exenterator'].Mid = set_combine(sets.precast.WS['Exenterator'], {})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'].Mid, {})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mid, {})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mid, {})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].SA, {})
	
	sets.precast.WS['Aeolian Edge'] = {
		ammo="Seething Bomblet +1",
		head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Samnuha Coat",
		hands="Pursuer's Cuffs",
		ring1="Arvina Ringlet +1",
		ring2="Acumen Ring",
		back="Argochampsa Mantle",
		waist="Eschan Stone",
		legs=HerculeanLegs.Nuke,
		feet="Adhemar Gamashes"}
	
	--------------------------------------
	-- Misc sets
	--------------------------------------

	sets.resting = {}
	sets.defense.Evasion = {}
	sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Colossus's Earring",
		body="Meghanada Cuirie +1",
		hands="Iuitl Wristbands +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Meghanada Chausses +1",
		feet="Herculean Boots"}
	sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Samnuha Coat",
		hands="Floral Gauntlets",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Engulfer Cape +1",
		waist="Flax Sash",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}
	sets.Kiting = {feet="Jute Boots +1"}
end

function job_precast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = true
	end
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
		equip(sets.TreasureHunter)
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
		if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
			equip(sets.TreasureHunter)
		end
	end
	if spell.type == 'WeaponSkill' then
		if state.CapacityMode.value then
			equip(sets.CapacityMantle)
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
		equip(sets.TreasureHunter)
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
	end
	if spell.type == 'WeaponSkill' and not spell.interrupted then
		state.Buff['Sneak Attack'] = false
		state.Buff['Trick Attack'] = false
		state.Buff['Feint'] = false
	end
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
	check_buff('Feint', eventArgs)
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

function customize_idle_set(idleSet)
	if player.hpp < 80 then
		idleSet = set_combine(idleSet, sets.idle.Regen)
	end
	return idleSet
end

function customize_melee_set(meleeSet)
	if state.TreasureMode.value == 'Fulltime' then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end
	if state.CapacityMode.value then
		meleeSet = set_combine(meleeSet, sets.CapacityMantle)
	end
	return meleeSet
end

function job_buff_change(buff, gain)
	if S{'haste','march','mighty guard','embrava','haste samba','geo-haste','indi-haste'}:contains(buff:lower()) then
		determine_haste_group()
		handle_equipping_gear(player.status)
	end
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		if not midaction() then
			handle_equipping_gear(player.status)
		end
	end
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

function determine_haste_group()
	classes.CustomMeleeGroups:clear()
		-- buffactive[33] = Haste/Haste II 15%/30%
		-- buffactive[604] = Mighty Guard 15%
		-- buffactive[580] = Indi/Geo-Haste 29.9%/35.4%/40.9%
		-- buffactive[370] = Haste Samba 10%(Main) 5%(Sub)
		-- buffactive[228] = Embrava 30%
		-- Victory March +3/+4/+5 :: 14%/15.6%/17.1%
		-- Advancing March +3/+4/+5 :: 10.9%/12.5%/14%
	if (buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604])) or  --Indi/Geo-Haste + Anything
		(buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604])) or  --Embrava + anything
		(buffactive.march == 2 and (buffactive[33] or buffactive[604])) or  --March x2 + Anything
		(buffactive[33] and buffactive[604] and buffactive.march) then --Haste + Mighty Guard + March(s)
			classes.CustomMeleeGroups:append('MaxHaste')
	elseif ((buffactive[604] or buffactive[33]) and buffactive['haste samba'] and buffactive.march == 1) or --Mighty Guard/Haste + Samba + March
		(buffactive.march == 2 and buffactive['haste samba']) or
		(buffactive[580] and buffactive['haste samba']) then 
            classes.CustomMeleeGroups:append('MaxHaste')
	elseif ( buffactive.march == 2 ) or --March x2
		((buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  --Mighty Guard/Haste + March
		(buffactive[580] ) or  --Indi/Geo-Haste
		(buffactive[33] and buffactive[604]) then  --Haste + Mighty Guard
			classes.CustomMeleeGroups:append('MaxHaste')
	elseif buffactive[33] or buffactive[604] or buffactive.march == 2 then
			classes.CustomMeleeGroups:append('MidHaste')
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
		set_macro_page(1, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 3)
	else
		set_macro_page(1, 3)
	end
end
