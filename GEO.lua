function get_sets()
    mote_include_version = 2
	
    include('Mote-Include.lua')
end

function job_setup()
    indi_timer = ''
    indi_duration = 237
end

function user_setup()
    state.CastingMode:options('Normal', 'MagicBurst')
	state.IdleMode:options('Normal', 'Refresh')
	
	send_command('bind f5 ma IndiFury st')
	send_command('bind f6 ma IndiAcumen st')
	send_command('bind f7 ma IndiAttunement st')
	send_command('bind f8 ma IndiFocus st')
	send_command('bind f9 ma IndiFrailty st')
	
	send_command('bind ^f1 ja FullCircle') --MX1--
	send_command('bind ^f2 ja BlazeofGlory') --MX2--
	send_command('bind ^f3 ja Dematerialize') --MX3--
	send_command('bind ^f4 EclipticAttrition') --MX4--
	send_command('bind ^f5 LastingEmanation') --MX5--
	send_command('bind ^f6 TheurgicFocus') --MX6--
	send_command('bind ^f7 CollimatedFervor') --MX7--
	send_command('bind ^f8 MendingHalation') --MX8--
	send_command('bind ^f9 RadialArcana') --MX9--
	send_command('bind ^f10 Entrust') --MX10--
	
	send_command('bind !f1 ') --M1--
	send_command('bind !f2') --M2--
	send_command('bind !f3') --M3--
	--send_command('bind !f4')
	send_command('bind !f5') --M4--
	send_command('bind !f6 GeoFrailty') --M5--
	send_command('bind !f7 GeoMalaise') --M6--
	send_command('bind !f8 GeoVex') --M7--
	send_command('bind !f9 GeoLanguor') --M8--
	send_command('bind !f10 GeoTorpor') --M9--
	send_command('bind !f11') --M10--

    select_default_macro_book()
end

function user_unload()
	send_command('unbind f5')
	send_command('unbind f6')
	send_command('unbind f7')
	send_command('unbind f8')
	send_command('unbind f9')
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
    -- Job Abilties Sets
    --------------------------------------

    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +1",back="Nantosuelta's Cape"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1"}

    --------------------------------------
    -- Idle Sets
    --------------------------------------
	
    sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
		range="Dunna",
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Jhakri Robe +1",
		hands="Bagua Mitaines +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Slipor Sash",
		legs="Assiduity Pants +1",
		feet="Geomancy Sandals +1",}
    sets.idle.Pet = {
		main="Sucellus",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		body=TelchineBody.Pet,
		hands="Geomancy Mitaines +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Lifestream Cape",
		waist="Isa Belt",
		legs=TelchineLegs.Pet,
		feet="Bagua Sandals +1"}
    sets.idle.PDT = sets.idle
    sets.idle.Town = sets.idle
    sets.idle.Weak = sets.idle

    --------------------------------------
    -- Precast Sets
    --------------------------------------
	
    sets.precast.FC = {
		main="Sucellus", --5
		sub="Chanter's Shield", --3
		range="Dunna", --3
		head=MerlinicHead.FC, --15
		neck="Jeweled Collar", --3
		ear1="Loquacious Earring", --2
		ear2="Etiolation Earring", --1
		body="Anhur Robe", --10
		hands="Repartie Gloves", --2
		ring1="Prolix Ring", --2
		ring2="Weatherspoon Ring", --5
		back="Lifestream Cape", --7
		waist="Witful Belt", --3
		legs="Geomancy Pants +1", --11
		feet=MerlinicFeet.FC} --12
	sets.precast.Geomancy = sets.precast.FC
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		ammo="Impatiens",
		ear2="Barkarole Earring", --3
		hands="Bagua Mitaines +1"}) --12
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC,{ammo="Impatiens",waist="Siegel Sash"})
    sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {ammo="Impatiens"})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		main="Serenity",
		sub="Niobid Strap",
		ammo="Impatiens",
		head="Vanya Hood",
		hands="Vanya Cuffs",
		feet="Vanya Clogs"})
    sets.precast.FC.Impact = {head=empty,body="Twilight Cloak"}

    --------------------------------------
    -- Midcast Sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC
    sets.midcast.Geomancy = {
		range="Dunna",
		head="Vanya Hood",
		neck="Incanter's Torque",
		body="Amalric Doublet",
		hands="Geomancy Mitaines +1",
		ring1="Stikini Ring",
		back="Lifestream Cape",
		legs="Bagua Pants +1",
		feet="Medium's Sabots"}
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {feet="Azimuth Gaiters +1"})
	sets.midcast['Enhancing Magic'] = {
		main="Serenity",
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
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels",
		feet="Regal Pumps +1"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar Sash"})
	sets.midcast['Elemental Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.MAB,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
		back="Nantosuelta's Cape",
		waist=gear.ElementalObi,
		legs=MerlinicLegs.MAB,
		feet=MerlinicFeet.MAB}
	sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'], {
		ear1="Dignitary's Earring",
		ring2="Mujin Band",
		neck="Mizukage-no-Kubikazari",
		hands="Amalric Gages",
		back="Seshaw Cape",
		legs=MerlinicLegs.MB,
		feet=MerlinicFeet.MB})
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.midcast['Enfeebling Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Hydrocera",
		head=MerlinicHead.ACC,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Shango Robe",
		hands="Azimuth Gloves +1",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back="Nantosuelta's Cape",
		waist="Eschan Stone",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"}
	sets.midcast['Dark Magic'] = {
		main="Rubicundity",
		sub="Chanter's Shield",
		ammo="Pemphredo Tathlum",
		head="Bagua Galero +1",
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Hirudinea Earring",
		body="Shango Robe",
		hands="Helios Gloves",
		ring1="Stikini Ring",
		ring2="Evanescence Ring",
		back="Perimede Cape",
		waist="Fucho-no-obi",
		legs="Azimuth Tights +1",
		feet=MerlinicFeet.Dark}
	sets.midcast.Stun = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Impatiens",
		head=MerlinicHead.ACC,
		neck="Jeweled Collar",
		ear1="Loquac. Earring",
		ear2="Barkarole Earring",
		body="Shango Robe",
		hands="Azimuth Gloves +1",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back="Lifestream Cape",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet=MerlinicFeet.Dark}
    sets.midcast.Cure = {
		main="Serenity",
		sub="Niobid Strap",
		ammo="Quartz Tathlum +1",
		head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Healing Earring",
		ear2="Beatific Earring",
		body="Vrikodara Jupon",
		hands="Vanya Cuffs",
		ring1="Sirona's Ring",
		ring2="Haoma's Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Gyve Trousers",
		feet="Vanya Clogs"}
    sets.midcast.Cursna = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Impatiens",
		head="Vanya Hood",
		neck="Malison Medallion",
		body="Vrikodara Jupon",
		--hands="Hieros Mittens",
		ring1="Ephedra Ring",
		ring2="Ephedra Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Geomancy Pants +1",
		feet="Vanya Clogs"}
    sets.midcast.Curaga = sets.midcast.Cure

    --------------------------------------
    -- Engaged Sets
    --------------------------------------
	
    sets.engaged = {
		main="Sucellus",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		body=TelchineBody.Pet,
		hands="Geomancy Mitaines +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Lifestream Cape",
		waist="Isa Belt",
		legs=TelchineLegs.Pet,
		feet="Bagua Sandals +1"}
		
    --------------------------------------
    -- Weaponskill Sets
    --------------------------------------

    sets.precast.WS = {}
	
    --------------------------------------
    -- Misc Sets
    --------------------------------------
	
    sets.resting = {}
	sets.defense.PDT = {
		head="Hagondes Hat +1",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Colossus's Earring",
		body="Onca Suit",
		hands=empty,
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Slipor Sash",
		legs=empty,
		feet=empty}
    sets.defense.MDT = set_combine(sets.defense.PDT, {ear1="Odnowa Earring +1",ear2="Etiolation Earring",ring1="Purity Ring"})
	
    sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
end

function job_precast(spell, action, spellMap, eventArgs)
	if spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Refoccilation Stone"
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end

function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub')
        else
            enable('main','sub')
        end
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'SCH' then
        set_macro_page(2, 6)
    else
        set_macro_page(1, 6)
    end
end
