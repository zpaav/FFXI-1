function get_sets()
    mote_include_version = 2

	include('Mote-Include.lua')
end

function job_setup()
	state.Buff.Barrage = buffactive.Barrage or false
	state.Buff.Camouflage = buffactive.Camouflage or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
end

function user_setup()
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal', 'Acc')
    state.OffenseMode:options('Normal', 'Acc')

	gear.default.obi_waist = "Eschan Stone"
	
	DefaultAmmo = {['Holliday'] = "Orichalcum Bullet"}
	U_Shot_Ammo = {['Holliday'] = "Animikii Bullet"}

	send_command('bind ` gs c cycle RangedMode')
	send_command('bind ^` gs c cycle OffenseMode')
	
	send_command('bind ^f1 nin UtsusemiNi') --MX1--
	send_command('bind ^f2 nin UtsusemiIchi') --MX2--
	send_command('bind ^f3 ja BountyShot') --MX3--
	send_command('bind ^f4 ja DecoyShot') --MX4--
	send_command('bind ^f5 ja Camouflage') --MX5--

	send_command('bind ^f6 input /ra') --MX6--
	send_command('bind ^f7 ja Shadowbind') --MX7--
	send_command('bind ^f8 ja UnlimitedShot') --MX8--
	send_command('bind ^f9 ja DoubleShot') --MX9--
	send_command('bind ^f10 ja FlashyShot') --MX10--
	
	send_command('bind !f1 ws Trueflight') --M1--
	send_command('bind !f2 ws Wildfire') --M2--
	send_command('bind !f3 ws LastStand') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws Detonator') --M4--
	send_command('bind !f6 ws JishnusRadiance') --M5--
	send_command('bind !f7 ws ApexArrow') --M6--
	send_command('bind !f8 ws EmpyrealArrow') --M7--
	send_command('bind !f9') --M8--
	
	select_default_macro_book()
end

function user_unload()
	send_command('unbind `')
	send_command('unbind ^`')
	
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
	-- Precast sets
	--------------------------------------

	sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2",waist="Chaac Belt"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}

	sets.precast.FC = {
		head="Herculean Helm",
		neck="Jeweled Collar",
		ear2="Loquacious Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
		back="",
		waist="",
		legs="Gyve Trousers",
		feet=""}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

	sets.precast.RA = {
		head="Amini Gapette",
		neck="Erudition Necklace",
		ear1="Enervating Earring",
		ear2="Neritic Earring",
		body="Amini Caban",
		hands="Iuitl Wristbands +1", --Carmine Finger Gauntlets +1--
		ring1="Petrov Ring",
		ring2="Rajas Ring",
		back="Belenus's Cape",
		waist="Impulse Belt",
		legs="Orion braccae +1",
		feet="Meghanada Jambeaux +1"}
		
    --------------------------------------
    -- Weaponskill sets
    --------------------------------------

	sets.precast.WS = {}

	sets.precast.WS.Acc = sets.precast.WS
	
	sets.precast.WS['Trueflight'] = {
		head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Samnuha Coat",
		hands="Pursuer's Cuffs",
		ring1="Arvina Ringlet +1",
		ring2="Weatherspoon Ring",
		back="Argochampsa Mantle",
		waist=gear.ElementalObi,
		legs=HerculeanLegs.Nuke,
		feet=HerculeanFeet.TA}
		
	sets.precast.WS['Wildfire'] = {
		head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Samnuha Coat",
		hands="Pursuer's Cuffs",
		ring1="Arvina Ringlet +1",
		ring2="Acumen Ring",
		back="Argochampsa Mantle",
		waist=gear.ElementalObi,
		legs=HerculeanLegs.Nuke,
		feet=HerculeanFeet.TA}
		
	sets.precast.WS['Last Stand'] = {
		head="Meghanada Visor +1",
		neck=gear.ElementalGorget,
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Pursuer's Doublet",
		hands="Meghanada Gloves +1",
		ring1="Apate Ring",
		ring2="Garuda Ring +1",
		back="Belenus's Cape",
		waist=gear.ElementalBelt,
		legs="Meghanada Chausses +1",
		feet="Meghanada Jambeaux +1"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.Utsusemi = sets.precast.FC

	sets.midcast.RA = {
		head="Amini Gapette",
		neck="Erudition Necklace",
		ear1="Enervating Earring",
		ear2="Neritic Earring",
		body="Amini Caban",
		hands="Pursuer's Cuffs",
		ring1="Petrov Ring",
		ring2="Rajas Ring",
		back="Belenus's Cape",
		waist="Yemaya Belt",
		legs="Pursuer's Pants",
		feet="Pursuer's Gaiters"}
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	sets.resting = {}

	sets.idle = {
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Mekosuchinae harness",
		hands="Iuitl Wristbands +1",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flax Sash",
		legs="Iuitl Tights +1",
		feet="Jute Boots +1"}

	sets.defense.PDT = {
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet="Herculean Boots"}

	sets.defense.MDT = {
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
	
	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Amini Gapette",
		neck="Erudition Necklace",
		ear1="Enervating Earring",
		ear2="Neritic Earring",
		body="Amini Caban",
		hands="Iuitl Wristbands +1", --Carmine Finger Gauntlets +1--
		ring1="Petrov Ring",
		ring2="Rajas Ring",
		back="Belenus's Cape",
		waist="Impulse Belt",
		legs="Orion braccae +1",
		feet="Meghanada Jambeaux +1"}
		
	sets.engaged.Acc = {
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Bleating Mantle",
		waist="Kentarch Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers +1"})
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
end

function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end
	if spell.action_type == 'Ranged Attack' or
	  (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo(spell, action, spellMap, eventArgs)
	end
	if state.DefenseMode.value ~= 'None' and spell.type == 'WeaponSkill' then
		eventArgs.handled = true
	end
end

function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
		equip(sets.buff.Barrage)
		eventArgs.handled = true
	end
end

function job_buff_change(buff, gain)
	if buff == "Camouflage" then
		if gain then
			equip(sets.buff.Camouflage)
			disable('body')
		else
			enable('body')
		end
	end
end

function check_ammo(spell, action, spellMap, eventArgs)
	if state.Buff['Unlimited Shot'] then
		if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
			if player.inventory[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
				equip({ammo=U_Shot_Ammo[player.equipment.range]})
			elseif player.inventory[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
			end
		end
	else
		if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
					equip({ammo=empty})
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
				equip({ammo=empty})
			end
		elseif player.equipment.ammo == 'empty' then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
			end
		elseif player.inventory[player.equipment.ammo].count < 15 then
			add_to_chat(122,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count..")")
		end
	end
end

function select_default_macro_book()
	set_macro_page(1, 8)
end
