-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------
-- Haste II has the same buff ID [33], so we have to use a toggle. 
-- gs c toggle hastemode -- Toggles whether or not you're getting Haste II
-- for Rune Fencer sub, you need to create two macros. One cycles runes, and gives you descrptive text in the log.
-- The other macro will use the actual rune you cycled to. 
-- Macro #1 //console gs c cycle Runes
-- Macro #2 //console gs c toggle UseRune
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
end

function job_setup()
    include('Mote-TreasureHunter')
	
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Sange = buffactive.sange or false
    state.Buff.Innin = buffactive.innin or false
    state.TreasureMode:set('Tag')
    state.HasteMode = M{['description']='Haste Mode', 'Hi', 'Normal'}
    state.CapacityMode = M(false, 'Capacity Point Mantle')
	state.warned = M(false)

    select_ammo()
    gear.RegularAmmo = 'Togakushi Shuriken'
    gear.SangeAmmo = 'Happo Shuriken'
	
    LugraWSList = S{'Blade: Shun','Blade: Ku','Blade: Jin','Blade: Metsu','Blade: Kamu'}
	wsList = S{'Blade: Hi','Blade: Kamu','Blade: Shun','Blade: Metsu','Blade: Ten'}
	
    update_combat_form()

    options.ammo_warning_limit = 25
    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

function user_setup()
    state.OffenseMode:options('Normal','Low','Mid','Acc')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Normal','Low','Mid','Acc')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

	state.RuneMode = M('None','Lux','Tenebrae','Ignis','Gelus','Flabra','Tellus','Sulpor','Unda')
	
    select_default_macro_book()

    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind @f9 gs c cycle HasteMode')

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
	
	send_command('bind !f1 ws BladeShun') --M1--
	send_command('bind !f2 ws BladeTen') --M2--
	send_command('bind !f3 ws BladeKamu') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws BladeMetsu') --M4--
	send_command('bind !f6 ja Issekigan') --M5--
	send_command('bind !f7 ja Yonin') --M6--
	send_command('bind !f8 ja Innin') --M7--
	send_command('bind !f9 ja Sange') --M8--
	send_command('bind !f10') --M9--
	send_command('bind !f11 input /apururu(uc);wait 6;/kingofhearts;wait 6;/ullegore;wait 6;/fablinix') --M10--
end


function file_unload()
    send_command('unbind ^[')
    send_command('unbind ![')
    send_command('unbind ^=')
    send_command('unbind !=')
    send_command('unbind @f9')
    send_command('unbind @[')
	
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
    Andartia.TP = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
    Andartia.DEXWS = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    Andartia.STRWS = {name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
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
    -- Utility sets
    --------------------------------------

    sets.TreasureHunter = {waist="Chaac Belt"}
    sets.CapacityMantle = {back="Mecistopins Mantle"}
	
    sets.WSDayBonus = {head="Gavialis Helm"}
    sets.Lugra = {ear1="Lugra Earring", ear2="Lugra Earring +1"}
	sets.MoonshadeWS = {ear1="Moonshade Earring",ear2="Ishvara Earring"}
    sets.MoonLugra = {ear1="Moonshade Earring", ear2="Lugra Earring +1"}
    sets.BrutalMoon = {ear1="Brutal Earring",ear2="Moonshade Earring"}
    sets.DEXWS = {ear1="Dominance Earring +1",ear2="Ishvara Earring"}
    sets.Rajas = {ring1="Petrov Ring"}

    sets.RegularAmmo = {ammo=gear.RegularAmmo}
    sets.SangeAmmo = {ammo=gear.SangeAmmo}
	
    sets.DayMovement = {feet="Danzo sune-ate"}
    sets.NightMovement = {feet="Hachiya Kyahan +1"}

    sets.NightAccAmmo = {ammo="Ginsen"}
    sets.DayAccAmmo = {ammo="Tengu-no-Hane"}
	
    sets.Organizer = {shihei="Shihei",inoshi="Inoshishinofuda",shika="Shikanofuda",chono="Chonofuda"}
	
    --------------------------------------
    -- Job Abilties
    --------------------------------------
	
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
    sets.precast.JA['Futae'] = {hands="Hattori Tekko"}
    sets.precast.JA['Provoke'] = {}
    sets.precast.JA.Sange = {ammo=gear.SangeAmmo,body="Mochizuki Chainmail +1"}
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}
    sets.precast.Step = {}
	
    sets.precast.Effusion = {}
    sets.precast.Effusion.Lunge = sets.midcast.ElementalNinjutsu
    sets.precast.Effusion.Swipe = sets.midcast.ElementalNinjutsu

    sets.midcast.Trust =  {}
    sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {})

    --------------------------------------
    -- Idle Sets
    --------------------------------------
	
    sets.idle = {
		ammo="Staunch Tathlum",
		head="Genmei Kabuto",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Emet Harness +1",
		hands="Otronif Gloves +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		legs="Otronif Brais +1",
		feet=gear.MovementFeet}
    sets.idle.Regen = set_combine(sets.idle, {})
    sets.idle.Town = set_combine(sets.idle, {})
    sets.idle.Weak = sets.idle

    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    sets.precast.FC = {
		ammo="Impatiens",
		head="Herculean Helm", --7
		neck="Jeweled Collar", --3
		ear1="Loquacious Earring", --2
		ear2="Etiolation Earring", --2
		body="Dread Jupon", --7
		hands="Leyline Gloves", --8
		ring1="Prolix Ring", --2
		ring2="Weatherspoon ring", --5
		back="Andartia's Mantle", --10
		waist="",
		legs="Gyve Trousers",
		feet="Amm Greaves"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1"})

    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
    sets.midcast.FastRecast = sets.precast.FC
    sets.midcast.Ninjutsu = sets.precast.FC
    sets.midcast.SelfNinjutsu = sets.precast.FC
    sets.midcast.Migawari = set_combine(sets.midcast.Ninjutsu, {})
    sets.midcast.Utsusemi = set_combine(sets.midcast.Ninjutsu, {
		neck="Jeweled Collar",
		body="Dread Jupon",
		back="Andartia's Mantle",
		feet="Hattori Kyahan"})
    sets.midcast.ElementalNinjutsu = {
		ammo="Seething Bomblet +1",
		head="Mochizuki Hatsuburi +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Samnuha Coat",
		hands="Leyline Gloves",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
		back="Argochampsa Mantle",
		waist=gear.ElementalObi,
		legs=HerculeanLegs.Nuke,
		feet="Herculean Boots"}
	
	--------------------------------------
	-- Engaged sets
	--------------------------------------
	
    sets.engaged = {
		ammo=gear.RegularAmmo,
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
    sets.engaged.Low = set_combine(sets.engaged, {waist="Kentarch Belt +1",})
    sets.engaged.Mid = set_combine(sets.engaged.Low, {})
    sets.engaged.Acc = set_combine(sets.engaged.Mid, {
		head="Dampening Tam",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ear1="Dignitary's Earring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.CritAGI})
	
    sets.engaged.MidHaste = {
		ammo=gear.RegularAmmo,
		head="Ryuo Somen",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Andartia.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet="Hizamaru sune-ate +1"}
    sets.engaged.Low.MidHaste = set_combine(sets.engaged.Low.MidHaste, {waist="Kentarch Belt +1",})
    sets.engaged.Mid.MidHaste = set_combine(sets.engaged.Mid.MidHaste, {})
    sets.engaged.Acc.MidHaste = set_combine(sets.engaged.Acc.MidHaste, {
		head="Dampening Tam",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ear1="Dignitary's Earring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.CritAGI})

    sets.engaged.MaxHaste = {
		ammo=gear.RegularAmmo,
		head="Adhemar Bonnet",
		neck="Erudition Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body=HerculeanBody.TA,
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Andartia.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
    sets.engaged.Low.MaxHaste = set_combine(sets.engaged.MaxHaste, {waist="Kentarch Belt +1",})
    sets.engaged.Mid.MaxHaste = set_combine(sets.engaged.Low.MaxHaste, {})
    sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.Mid.MaxHaste, {
		head="Dampening Tam",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ear1="Dignitary's Earring",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1",
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.CritAGI})

    --------------------------------------
    -- Weaponskill sets
    --------------------------------------
	
    sets.precast.WS = {}
    sets.precast.WS.Mid = set_combine(sets.precast.WS, {})
    sets.precast.WS.Low = sets.precast.WS.Mid
    sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {})
    
    sets.Shun = {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="AdhemarHands.B",
		ring1="Epona's Ring",
		ring2="Ramuh Ring +1",
		back=Andartia.TP,
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, sets.Shun)
    sets.precast.WS['Blade: Shun'].Low = set_combine(sets.precast.WS.Low, sets.Shun)
    sets.precast.WS['Blade: Shun'].Mid = set_combine(sets.precast.WS.Mid, sets.Shun)
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, sets.Shun)
	
    sets.Ten = {
		ammo="Seething Bomblet +1",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body=HerculeanBody.STRWS,
		hands=HerculeanHands.STRWS,
		ring1="Rajas Ring",
		ring2="Ifrit Ring",
		back=Andartia.STRWS,
		waist="Grunfeld Rope",
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.STRWS}
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, sets.Ten)
    sets.precast.WS['Blade: Ten'].Low = set_combine(sets.precast.WS['Blade: Ten'], {})
    sets.precast.WS['Blade: Ten'].Mid = set_combine(sets.precast.WS['Blade: Ten'].Low, {})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'].Mid, {})

	sets.Hi = {
		ammo="Yetshila",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Abnoba Kaftan",
		hands="Ryuo Tekko",
		ring1="Epona's Ring",
		ring2="Begrudging Ring",
        back=Andartia.DEXWS,
		waist="Sveltesse Gouriz +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.CritAGI}
    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, sets.Hi)
    sets.precast.WS['Blade: Hi'].Low = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].Mid = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'].Mid, {})

    sets.Kamu = {
		ammo="Seething Bomblet +1",
		head="Lilitu Headpiece",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Ishvara Earring",
		body=HerculeanBody.STRWS,
		hands=HerculeanHands.STRWS,
		ring1="Rajas Ring",
		ring2="Ifrit Ring",
		back=Andartia.STRWS,
		waist=gear.ElementalBelt,
		legs="Hizamaru Hizayoroi +1",
		feet=HerculeanFeet.STRWS}
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Low = set_combine(sets.precast.WS.Low, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Mid = set_combine(sets.precast.WS.Mid, sets.Kamu)
    sets.precast.WS['Blade: Kamu'].Acc = set_combine(sets.precast.WS.Acc, sets.Kamu, {})
    
    sets.Metsu = {
		ammo="Jukukik Feather",
		head=HerculeanHead.DEXWS,
		neck="Caro Necklace",
		ear1="Dominance Earring +1",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Ramuh Ring +1",
		back=Andartia.DEXWS,
		waist="Grunfeld Rope",
		legs="Samnuha Tights",
		feet=HerculeanFeet.DEXWS}
    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, sets.Metsu)
    sets.precast.WS['Blade: Metsu'].Low = set_combine(sets.precast.WS['Blade: Metsu'], {})
    sets.precast.WS['Blade: Metsu'].Mid = set_combine(sets.precast.WS['Blade: Metsu'].Low, {})
    sets.precast.WS['Blade: Metsu'].Acc = set_combine(sets.precast.WS['Blade: Metsu'].Mid, {})

    sets.Ku = {}
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, sets.Ku)
    sets.precast.WS['Blade: Ku'].Low = set_combine(sets.precast.WS['Blade: Ku'], {})
    sets.precast.WS['Blade: Ku'].Mid = sets.precast.WS['Blade: Ku'].Low
    sets.precast.WS['Blade: Ku'].Acc = set_combine(sets.precast.WS['Blade: Ku'].Mid, {})

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS['Aeolian Edge'], {})
    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']

	--------------------------------------
	-- Misc sets
	--------------------------------------
	
    sets.buff.Migawari = {body="Hattori Ningi"}
    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head="Genmei Kabuto",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Emet Harness +1",
		hands=HerculeanHands.TA,
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		legs="Otronif Brais +1",
		feet="Amm Greaves"}
    sets.defense.MDT = set_combine(sets.defense.PDT, {
		head="Dampening Tam",
		ear1="Odnowa Earring +1",
		hands="Floral Gauntlets",
		ring1="Purity Ring",
		back="Engulfer Cape +1",
		waist="Flax Sash",})
end

function job_pretarget(spell, action, spellMap, eventArgs)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = true
    end
    if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
    end
end

function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Blade: Ten" and player.tp > 2250 then
        equip({ear2="Ishvara Earring"})
    end
    if spell.skill == "Ninjutsu" and spell.target.type:lower() == 'self' and spellMap ~= "Utsusemi" then
        if spell.english == "Migawari" then
            classes.CustomClass = "Migawari"
        else
            classes.CustomClass = "SelfNinjutsu"
        end
    end
    if spell.name == 'Spectral Jig' and buffactive.sneak then
        send_command('cancel 71')
    end
    if string.find(spell.english, 'Utsusemi') then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
            cancel_spell()
            eventArgs.cancel = true
            return
        end
    end
	if spell.english == 'Unda' then
		if state.RuneMode.value == 'Lux' then
            send_command('input /jobability "Lux" <me>')
            add_to_chat(122, 'Lux -- Light')
            eventArgs.cancel = true
            return	
		elseif state.RuneMode.value == 'Tenebrae' then
            send_command('input /jobability "Tenebrae" <me>')
            add_to_chat(122, 'Tenebrae -- Dark')
            eventArgs.cancel = true
            return		
        elseif state.RuneMode.value == 'Ignis' then
            send_command('input /jobability "Ignis" <me>')
            add_to_chat(122, 'Ignis -- Fire (Ice)')
            eventArgs.cancel = true
            return	
		elseif state.RuneMode.value == 'Gelus' then
            send_command('input /jobability "Gelus" <me>')
            add_to_chat(122, 'Gelus -- Ice (Wind)')
            eventArgs.cancel = true
            return
		elseif state.RuneMode.value == 'Flabra' then
            send_command('input /jobability "Flabra" <me>')
            add_to_chat(122, 'Flabra -- Wind (Earth)')
            eventArgs.cancel = true
            return	
		elseif state.RuneMode.value == 'Tellus' then
            send_command('input /jobability "Tellus" <me>')
            add_to_chat(122, 'Tellus -- Earth (Thunder)')
            eventArgs.cancel = true
            return	
		elseif state.RuneMode.value == 'Sulpor' then
            send_command('input /jobability "Sulpor" <me>')
            add_to_chat(122, 'Sulpor -- Thunder (Water)')
            eventArgs.cancel = true
            return	
		elseif state.RuneMode.value == 'Unda' then
            add_to_chat(122, 'Unda -- Water (Fire)')
            return
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' and state.OffenseMode ~= 'Acc' then
        equip( sets.SangeAmmo )
    end
    if spell.name == 'Sange' and player.equipment.ammo == gear.RegularAmmo then
        state.Buff.Sange = false
        eventArgs.cancel = true
    end
    if spell.type == 'WeaponSkill' then
        if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
            equip(sets.TreasureHunter)
        end
        if state.CapacityMode.value then
            equip(sets.CapacityMantle)
        end
        if is_sc_element_today(spell) then
            if wsList:contains(spell.english) then
            else
                equip(sets.WSDayBonus)
            end
        end
        if state.OffenseMode.value == 'Acc' then
            equip(select_ws_ammo())
        end
        if LugraWSList:contains(spell.english) then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.MoonLugra)
            else
                equip(sets.BrutalTrux)
            end
        elseif spell.english == 'Blade: Hi' or spell.english == 'Blade: Ten' then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.MoonLugra)
            else
                equip(sets.MoonshadeWS)
            end
        elseif spell.english == 'Blade: Metsu' then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.Lugra)
            else
                equip{sets.DEXWS}
            end
        elseif spell.english == 'Blade: Shun' then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.Lugra)
            else
                equip{sets.BrutalMoon}
            end
        elseif spell.english == 'Blade: Kamu' then
            if world.time >= (17*60) or world.time <= (7*60) then
                equip(sets.Lugra)
            else
                equip{sets.DEXWS}
            end
        end

    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if spell.english == "Monomi: Ichi" then
        if buffactive['Sneak'] then
            send_command('@wait 1.7;cancel sneak')
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    --if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
    --    equip(sets.TreasureHunter)
    --end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if midaction() then
        return
    end
    aw_custom_aftermath_timers_aftercast(spell)
end

function job_handle_equipping_gear(status, eventArgs)
end

function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    if state.HybridMode.value == 'PDT' then
        if state.Buff.Migawari then
            idleSet = set_combine(idleSet, sets.buff.Migawari)
        else 
            idleSet = set_combine(idleSet, sets.defense.PDT)
        end
    else
        idleSet = set_combine(idleSet, select_movement())
    end
    --local res = require('resources')
    --local info = windower.ffxi.get_info()
    --local zone = res.zones[info.zone].name
    --if zone:match('Adoulin') then
    --    idleSet = set_combine(idleSet, sets.Adoulin)
    --end
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    if state.Buff.Migawari and state.HybridMode.value == 'PDT' then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if player.equipment.sub == 'empty' then
        meleeSet = set_combine(meleeSet, sets.NoDW)
    end
    if player.mp < 100 and state.OffenseMode.value ~= 'Acc' then
        meleeSet = set_combine(meleeSet, sets.Rajas)
    end
    meleeSet = set_combine(meleeSet, select_ammo())
    return meleeSet
end

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
    if (buff == 'Innin' and gain or buffactive['Innin']) then
        state.CombatForm:set('Innin')
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    else
        state.CombatForm:reset()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
    if S{'haste','march','mighty guard','embrava','haste samba','geo-haste','indi-haste'}:contains(buff:lower()) then
        determine_haste_group()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end

function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        update_combat_form()
    end
end

--mov = {counter=0}
--if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
--    mov.x = windower.ffxi.get_mob_by_index(player.index).x
--    mov.y = windower.ffxi.get_mob_by_index(player.index).y
--    mov.z = windower.ffxi.get_mob_by_index(player.index).z
--end
--moving = false
--windower.raw_register_event('prerender',function()
--    mov.counter = mov.counter + 1;
--    if mov.counter>15 then
--        local pl = windower.ffxi.get_mob_by_index(player.index)
--        if pl and pl.x and mov.x then
--            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
--            if dist > 1 and not moving then
--                state.Moving.value = true
--                send_command('gs c update')
--                moving = true
--            elseif dist < 1 and moving then
--                state.Moving.value = false
--                --send_command('gs c update')
--                moving = false
--            end
--        end
--        if pl and pl.x then
--            mov.x = pl.x
--            mov.y = pl.y
--            mov.z = pl.z
--        end
--        mov.counter = 0
--    end
--end)

function job_update(cmdParams, eventArgs)
   -- local res = require('resources')
   -- local info = windower.ffxi.get_info()
   -- local zone = res.zones[info.zone].name
   -- if state.Moving.value == true then
   --     if zone:match('Adoulin') then
   --         equip(sets.Adoulin)
   --     end
   --     equip(select_movement())
   -- end
    select_ammo()
    --determine_haste_group()
    update_combat_form()
    run_sj = player.sub_job == 'RUN' or false
    --select_movement()
    th_update(cmdParams, eventArgs)
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
        then 
            return true
    end
end

function select_movement()
    if world.time >= (17*60) or world.time <= (7*60) then
        return sets.NightMovement
    else
        return sets.DayMovement
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
		-- state.HasteMode = toggle for when you know Haste II is being cast on you
		-- Hi = Haste II is being cast. This is clunky to use when both haste II and haste I are being cast
    if state.HasteMode.value == 'Hi' then
        if (((buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604])) or
             (buffactive[33] and (buffactive[580] or buffactive.embrava)) or
             (buffactive.march == 2 and buffactive[604] ) ) then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif ((buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba']) then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif ((buffactive[580] or buffactive[33] or buffactive.march == 2) or
                 (buffactive.march == 1 and buffactive[604])) then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif (buffactive.march == 1 or buffactive[604]) then
            classes.CustomMeleeGroups:append('MaxHaste')
        end
    else
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
				classes.CustomMeleeGroups:append('MaxHaste')
		end
	end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Capacity Point Mantle' then
        gear.Back = newValue
    elseif stateField == 'Runes' then
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

--function job_get_spell_map(spell, default_spell_map)
--    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
--        return 'HighTierNuke'
--    end
--end

function job_get_spell_map(spell, default_spell_map)
    if spell.type == 'Trust' then
        return 'Trust'
    end
end

function display_current_job_state(eventArgs)
    local msg = ''
    msg = msg .. 'Offense: '..state.OffenseMode.current
    msg = msg .. ', Hybrid: '..state.HybridMode.current

    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    if state.HasteMode.value ~= 'Normal' then
        msg = msg .. ', Haste: '..state.HasteMode.current
    end
    if state.RangedMode.value ~= 'Normal' then
        msg = msg .. ', Rng: '..state.RangedMode.current
    end
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end
    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(123, msg)
    eventArgs.handled = true
end

function aw_custom_aftermath_timers_precast(spell)
    if spell.type == 'WeaponSkill' then
        info.aftermath = {}

        local empy_ws = "Blade: Hi"

        info.aftermath.weaponskill = empy_ws
        info.aftermath.duration = 0

        info.aftermath.level = math.floor(player.tp / 1000)
        if info.aftermath.level == 0 then
            info.aftermath.level = 1
        end

        if spell.english == empy_ws and player.equipment.main == 'Kannagi' then
            if buffactive['Aftermath: Lv.3'] then
                return
            end
            if info.aftermath.level ~= 3 and buffactive['Aftermath: Lv.2'] then
                return
            end
            info.aftermath.duration = 30 * info.aftermath.level
        end
    end
end

function aw_custom_aftermath_timers_aftercast(spell)
    if not spell.interrupted and spell.type == 'WeaponSkill' and
        info.aftermath and info.aftermath.weaponskill == spell.english and info.aftermath.duration > 0 then

        local aftermath_name = 'Aftermath: Lv.'..tostring(info.aftermath.level)
        send_command('timers d "Aftermath: Lv.1"')
        send_command('timers d "Aftermath: Lv.2"')
        send_command('timers d "Aftermath: Lv.3"')
        send_command('timers c "'..aftermath_name..'" '..tostring(info.aftermath.duration)..' down abilities/aftermath'..tostring(info.aftermath.level)..'.png')

        info.aftermath = {}
    end
end

function select_ammo()
    if state.Buff.Sange then
        return sets.SangeAmmo
    else
        return sets.RegularAmmo
    end
end

function select_ws_ammo()
    if world.time >= (18*60) or world.time <= (6*60) then
        return sets.NightAccAmmo
    else
        return sets.DayAccAmmo
    end
end
function update_combat_form()
    if state.Buff.Innin then
        state.CombatForm:set('Innin')
    else
        state.CombatForm:reset()
    end
end

function select_default_macro_book()
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 2)
    else
        set_macro_page(1, 2)
    end
end
