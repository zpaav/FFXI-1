function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MagicBurst')
	
	send_command('bind ^f1 ja LightArts') --MX1--
	send_command('bind ^f2 ja Addendum: White') --MX2--
	send_command('bind ^f3 ja Accession') --MX3--
	send_command('bind ^f4 ja Perpetuance') --MX4--
	send_command('bind ^f5 ja Rapture') --MX5--
	send_command('bind ^f6 ja DarkArts') --MX6--
	send_command('bind ^f7 ja Addendum: Black') --MX7--
	send_command('bind ^f8 ja Ebullience') --MX8--
	send_command('bind ^f9 ja Manifestation') --MX9--
	send_command('bind ^f10 ja Parsimony') --MX10--
	
	send_command('bind !f1 ws Myrkr') --M1--
	send_command('bind !f2 ja Sublimation') --M2--
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
	
	sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
    --sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    --sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1"}

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	
    --------------------------------------
    -- Idle Sets
    --------------------------------------
	
    sets.idle.Town = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Homiliary",
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
		feet="Chironic Slippers"}
    sets.idle.Field = sets.idle.Town
    sets.idle.Field.PDT = sets.idle.Town
    sets.idle.Field.Stun = sets.idle.Town
    sets.idle.Weak = sets.idle.Town

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
		hands="Gendewitha Gages +1", --7
		ring1="Prolix Ring", --2
		ring2="Weatherspoon Ring", --5
		back="Swith Cape +1", --4
		waist="Witful Belt", --3
		legs="Psycloth Lappas", --7
		feet=MerlinicFeet.FC} --12
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole Earring"})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		head="Vanya Hood",
		hands="Vanya Cuffs",
		feet="Vanya Clogs"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = {head=empty,body="Twilight Cloak"}
	
    --------------------------------------
    -- Midcast Sets
    --------------------------------------
	
    sets.midcast.FastRecast = sets.precast.FC
    sets.midcast.Cure = {
		ammo="Hydrocera",
		head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Beatific Earring",
		ear2="Healing Earring",
		body="Kaykaus Bliaut",
		hands="Vanya Cuffs", -- Kaykaus Cuffs (A)
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Kaykaus Tights",
		feet="Vanya Clogs"}
    sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
    sets.midcast.Cursna = {
		ammo="Impatiens",
		head="Vanya Hood",
		neck="Malison Medallion",
		ear1="Beatific Earring",
		ear2="Healing Earring",
		body="Kaykaus Bliaut",
		hands="Vanya Cuffs",
		ring1="Ephedra Ring",
		ring2="Ephedra Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Kaykaus Tights",
		feet="Vanya Clogs"}
    sets.midcast.Cursna = sets.midcast.Cure
    sets.midcast['Enhancing Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Savant's Treatise",
		head="Arbatel Bonnet +1",
		neck="Incanter's Torque",
		body=TelchineBody.Enhance,
		hands="Arbatel Bracers +1",
		back="Perimede Cape",
		waist="Olympus Sash",
		legs=TelchineLegs.Enhance,
		feet=TelchineFeet.Enhance}
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Arbatel Bonnet +1",back="Bookworm's Cape",feet=TelchineFeet.Regen})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {back="Grapevine Cape",waist="Gishdubar Sash"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +1"})
    sets.midcast.MndEnfeebles = {
		ammo="Hydrocera",
		head=MerlinicHead.ACC,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Shango Robe",
		hands="Chironic Gloves",
		ring1="Stikini Ring",
		ring2="Weatherspoon Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"}
    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {ammo="Pemphredo Tathlum"})
    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.ACC,
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Barkarole Earring",
		body="Shango Robe",
		hands="Helios Gloves",
		ring1="Stikini Ring",
		ring2="Evanescence Ring",
		back="Bookworm's Cape",
		waist="Fucho-no-obi",
		legs="Psycloth Lappas",
		feet=MerlinicFeet.Dark}
    sets.midcast.Helix = {
		ammo="Ghastly Tathlum +1",
		head=MerlinicHead.MAB,
		neck="Sanctity Necklace",
		ear1="Crematio Earring",
		ear2="Barkarole Earring",
		body="Jhakri Robe +1",
		hands="Chironic Gloves",
		ring1="Shiva Ring +1",
		ring2="Fenrir Ring +1",
		back="Lugh's Cape",
		waist="Refoccilation Stone",
		legs=MerlinicLegs.MAB,
		feet="Amalric Nails"}
    sets.midcast.Helix.MagicBurst = set_combine(sets.midcast.Helix ,{
		neck="Mizukage-no-Kubikazari",
		ear1="Static Earring",
		hands="Amalric Gages",
		ring1="Mujin Band",
		legs=MerlinicLegs.MB})
    sets.midcast.Kaustra = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.MAB,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		body="Jhakri Robe +1",
		hands="Chironic Gloves",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
		back="Lugh's Cape",
		waist=gear.ElementalObi,
		legs=MerlinicLegs.MAB,
		feet=MerlinicFeet.MAB}
    sets.midcast.Kaustra.MagicBurst = set_combine(sets.midcast.Kaustra ,{
		neck="Mizukage-no-Kubikazari",
		hands="Amalric Gages",
		ring2="Mujin Band",
		back="Seshaw Cape",
		leg=MerlinicLegs.MB})
    sets.midcast.Stun = {
		ammo="Pemphredo Tathlum",
		head=MerlinicHead.ACC,
		neck="Jeweled Collar",
		ear1="Loquac. Earring",
		ear2="Dignitary's Earring",
		body="Shango Robe",
		hands="Gendewitha Gages +1",
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
		hands="Chironic Gloves",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
		back="Lugh's Cape",
		waist=gear.ElementalObi,
		legs=MerlinicLegs.MAB,
		feet=MerlinicFeet.MAB}
    sets.midcast['Elemental Magic'].MagicBurst = set_combine(sets.midcast['Elemental Magic'] ,{
		neck="Mizukage-no-Kubikazari",
		hands="Amalric Gages",
		ring2="Mujin Band",
		back="Seshaw Cape",
		legs=MerlinicLegs.MB,
		feet=MerlinicFeet.MB})
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    --------------------------------------
    -- Engaged Sets
    --------------------------------------
	
    sets.engaged = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Homiliary",
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
		feet="Chironic Slippers"}
		
    --------------------------------------
    -- Weaponskill Sets
    --------------------------------------
	
    sets.precast.WS = {}
    sets.precast.WS['Myrkr'] = {
		ammo="Ghastly Tathlum +1",
		head="Amalric Coif",
		neck="Sanctity Necklace",
		ear1="Andoaa Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Tempered Cape +1",
		waist="Fucho-no-obi",
		legs="Amalric Slops",
		feet="Amalric Nails"}
		
    --------------------------------------
    -- Misc Sets
    --------------------------------------
	
    sets.resting = {}
    sets.defense.PDT = {
		head="Hagondes Hat +1",
		neck="Loricate Torque +1",
		ear1="Novia Earring",
		ear2="Colossus's Earring",
		body="Onca Suit",
		hands=empty,
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Slipor Sash",
		legs=empty,
		feet=empty}
    sets.defense.MDT = {set_combine(sets.defense.PDT, {
		ring1="Purity Ring",
		--back="Solemnity Cape",
		})}
    sets.latent_refresh = {waist="Fucho-no-obi"}
end

function job_precast(spell, action, spellMap, eventArgs)
	if spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Refoccilation Stone"
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
end

function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
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
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
		end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

function job_update(cmdParams, eventArgs)
    update_active_strategems()
    update_sublimation()
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
    if state.Buff.Klimaform then equip(sets.buff['Klimaform']) end
end

function handle_strategems(cmdParams)
    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

function get_current_strategem_count()
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end

function select_default_macro_book()
    set_macro_page(1, 1)
end
