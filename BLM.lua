function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
end

function user_setup()
    state.OffenseMode:options('Normal', 'Death')
    state.CastingMode:options('Normal', 'MagicBurst')
	state.IdleMode:options('Normal', 'Death')
    
    state.MagicBurst = M(false, 'Magic Burst')

	send_command('bind ^f1') --MX1--
	send_command('bind ^f2') --MX2--
	send_command('bind ^f3') --MX3--
	send_command('bind ^f4') --MX4--
	send_command('bind ^f5') --MX5--
	send_command('bind ^f6 ja ManaWall') --MX6--
	send_command('bind ^f7 ja EnmityDouse') --MX7--
	send_command('bind ^f8 ja Manawell') --MX8--
	send_command('bind ^f9 ja Cascade') --MX9--
	send_command('bind ^f10') --MX10--
	
	send_command('bind !f1 ws Myrkr') --M1--
	send_command('bind !f2') --M2--
	send_command('bind !f3') --M3--
	--send_command('bind !f4')
	send_command('bind !f5') --M4--
	send_command('bind !f6') --M5--
	send_command('bind !f7') --M6--
	send_command('bind !f8') --M7--
	send_command('bind !f9') --M8--
	send_command('bind !f10 input //DarkArts;wait 1.5;//Addendum:Black') --M9--
	send_command('bind !f11 gs c cycle IdleMode') --M10--
	
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
	
	Taranus = {}
	Taranus.Nuke = {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	Taranus.Death = {name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	
    MerlinicHead = {}
	MerlinicHead.ACC = {name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Enmity-3','MND+8','Mag. Acc.+12',}}
    MerlinicHead.MAB = {name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst mdg.+6%','INT+6','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	MerlinicHead.FC = {name="Merlinic Hood", augments={'"Mag.Atk.Bns."+14','"Fast Cast"+7','CHR+10',}}
	
	MerlinicLegs = {}
	MerlinicLegs.MAB = {name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic Damage +13','Mag. Acc.+4','"Mag.Atk.Bns."+14',}}
	MerlinicLegs.MB = {name="Merlinic Shalwar", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst mdg.+10%','INT+5','Mag. Acc.+13','"Mag.Atk.Bns."+10',}}
	
	MerlinicFeet = {}
	MerlinicFeet.Refresh = {name="Merlinic Crackows", augments={'Attack+24','CHR+10','"Refresh"+1','Mag. Acc.+9 "Mag.Atk.Bns."+9',}}
	MerlinicFeet.MAB = {name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','CHR+1','Mag. Acc.+15','"Mag.Atk.Bns."+11',}}
	MerlinicFeet.MB = {name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst mdg.+7%','MND+3','"Mag.Atk.Bns."+12',}}
	MerlinicFeet.FC = {name="Merlinic Crackows", augments={'Attack+12','"Fast Cast"+7','MND+7','Mag. Acc.+13',}}
	MerlinicFeet.Dark = {name="Merlinic Crackows", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +11',}}
	
	TelchineBody = {}
	TelchineBody.Pet = {name="Telchine Chas.", augments={'Pet: "Regen"+3',}}
	TelchineBody.Enhance = {name="Telchine Chas.", augments={'Pet: "Mag.Atk.Bns."+10','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}}
	TelchineBody.Regen = {}
	TelchineBody.Siphon = {}
	
	TelchineLegs = {}
	TelchineLegs.Pet = {name="Telchine Braconi", augments={'DEF+14','Pet: "Regen"+3','Pet: Damage taken -2%',}}
	TelchineLegs.Enhance = {name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}}
	TelchineLegs.Regen = {}
	TelchineLegs.Siphon = {}
	
	TelchineFeet = {}
	TelchineFeet.Pet = {}
	TelchineFeet.Enhance = {name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}}
	TelchineFeet.Regen = {name="Telchine Pigaches", augments={'"Regen" potency+3',}}

    --------------------------------------
    -- Job Abilties
    --------------------------------------
	
    sets.precast.JA['Mana Wall'] = {back=Taranus.Death,feet="Wicce Sabots"}
    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	
    sets.buff['Mana Wall'] = {back=Taranus.Death,feet="Wicce Sabots"}
	
    --------------------------------------
    -- Idle Sets
    --------------------------------------

    sets.idle = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Jhakri Robe +1",
		hands="Serpentes Cuffs",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Slipor Sash",
		legs="Assiduity Pants +1",
		feet=MerlinicFeet.Refresh}
    sets.idle.Death = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Amalric Coif",
		neck="Loricate Torque +1",
		ear1="Andoaa Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Bane Cape",
		waist="Fucho-no-obi",
		legs="Amalric Slops",
		feet="Amalric Nails"}
		
    --------------------------------------
    -- Precast Sets
    --------------------------------------
	
    sets.precast.FC = {
		ammo="Impatiens",
		head=MerlinicHead.FC, --15
		neck="Jeweled Collar", --3
		ear1="Loquacious Earring", --2
		ear2="Etiolation Earring", --1
		body="Anhur Robe", --10
		hands="Repartie Gloves", --2
		ring1="Prolix Ring", --2
		ring2="Weatherspoon Ring", --5
		back="Swith Cape +1", --4
		waist="Witful Belt", --3
		legs="Psycloth Lappas", --7
		feet=MerlinicFeet.FC} --12
	sets.precast.FC.Death = set_combine(sets.precast.FC, {
		head="Amalric Coif", --10
		ear1="Barkarole Earring", --8
		body="Shango Robe", --8
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		back="Bane Cape",
		feet="Amalric Nails"}) --5
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole Earring"})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		head="Vanya Hood",
		hands="Vanya Cuffs",
		feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure

    --------------------------------------
    -- Midcast Sets
    --------------------------------------
	
    sets.midcast.FastRecast = sets.precast.FC
    sets.midcast.Cure = {}
    sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast['Enhancing Magic'] = {
		head="Befouled Crown",
		ear1="Andoaa Earring",
		--ear2="Augmenting Earring",
		neck="Incanter's Torque",
		body=TelchineBody.Enhance,
		--hands="Ayao's Gages",
		back="Perimede Cape",
		waist="Olympus Sash",
		legs=TelchineLegs.Enhance,
		feet=TelchineFeet.Enhance}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar Sash"})
    sets.midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.ACC,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Shango Robe",
		hands="Helios Gloves",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back=Taranus.Nuke,
		waist="Eschan Stone",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"}
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.ACC,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Shango Robe",
		hands="Helios Gloves",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
		back="Bane Cape",
		waist="Fucho-no-obi",
		legs="Psycloth Lappas",
		feet=MerlinicFeet.Dark}
    sets.midcast.Stun = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.ACC,
		neck="Jeweled Collar",
		ear1="Dignitary's Earring",
		ear2="Loquac. Earring",
		body="Shango Robe",
		hands="Helios Gloves",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back="Swith Cape +1",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Amalric Nails"}
    sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.MAB,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		body="Jhakri Robe +1",
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
		back=Taranus.Nuke,
		waist=gear.ElementalObi,
		legs=MerlinicLegs.MAB,
		feet=MerlinicFeet.MAB}
    sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'] ,{
		--ear1="Dignitary's Earring",
		neck="Mizukage-no-Kubikazari",
		hands="Amalric Gages",
		ring2="Mujin Band",
		legs=MerlinicLegs.MB,
		feet=MerlinicFeet.MB})
	sets.midcast.Death = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.MAB,
		neck="Mizukage-no-Kubikazari",
		ear1="Barkarole Earring",
		ear2="Static Earring",
		body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		ring2="Archon Ring",
		back=Taranus.Death,
		waist=gear.ElementalObi,
		legs="Amalric Slops",
		feet="Amalric Nails"}
		
    --------------------------------------
    -- Engaged sets
    --------------------------------------
	
    sets.engaged = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Staunch Tathlum",
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Jhakri Robe +1",
		hands="Serpentes Cuffs",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Slipor Sash",
		legs="Assiduity Pants +1",
		feet=MerlinicFeet.Refresh}
    sets.engaged.Death = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Amalric Coif",
		neck="Loricate Torque +1",
		ear1="Andoaa Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Bane Cape",
		waist="Fucho-no-obi",
		legs="Amalric Slops",
		feet="Amalric Nails"}
		
    --------------------------------------
    -- Weaponskill Sets
    --------------------------------------
	
    sets.precast.WS = {}
    sets.precast.WS['Myrkr'] = {
		main="Lathi",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
		head="Amalric Coif",
		neck="Loricate Torque +1",
		ear1="Andoaa Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Bane Cape",
		waist="Fucho-no-obi",
		legs="Amalric Slops",
		feet="Amalric Nails"}
		
    --------------------------------------
    -- Misc Sets
    --------------------------------------
	
    sets.resting = {}
    sets.defense.PDT = {}
    sets.defense.MDT = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
end

function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Refoccilation Stone"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end

function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' then
            state.MagicBurst:reset()
        end
    end
end

function job_buff_change(buff, gain)
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function select_default_macro_book()
    set_macro_page(1, 9)
end
