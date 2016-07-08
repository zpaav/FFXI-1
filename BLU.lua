function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    state.Buff.Doom = buffactive.doom or false
	
    state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
    state.UseRune = M(false, 'Use Rune')
    state.UseWarp = M(false, 'Use Warp')
    state.Adoulin = M(false, 'Adoulin')
    state.Moving  = M(false, "moving")

    include('Mote-TreasureHunter')
    state.TreasureMode:set('Tag')
	
    run_sj = player.sub_job == 'RUN' or false

	gear.default.obi_waist = "Eschan Stone"
	
    blue_magic_maps = {}

    --------------------------------------
    -- Physical Spells
    --------------------------------------
	
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{'Bilgestorm'}

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{'Heavy Strike'}

    -- Physical spells with STR stat mod
    blue_magic_maps.PhysicalStr = S{'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave','Uppercut','Vertical Cleave'}
        
    -- Physical spells with DEX stat mod
    blue_magic_maps.PhysicalDex = S{'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault','Vanity Dive'}
        
    -- Physical spells with VIT stat mod
    blue_magic_maps.PhysicalVit = S{'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'}
        
    -- Physical spells with AGI stat mod
    blue_magic_maps.PhysicalAgi = S{'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'}

    -- Physical spells with INT stat mod
    blue_magic_maps.PhysicalInt = S{'Mandibular Bite','Queasyshroom'}

    -- Physical spells with MND stat mod
    blue_magic_maps.PhysicalMnd = S{'Ram Charge','Screwdriver','Tourbillion'}

    -- Physical spells with CHR stat mod
    blue_magic_maps.PhysicalChr = S{'Bludgeon'}

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{'Final Sting'}

    --------------------------------------
    -- Magical Spells
    --------------------------------------
	
    -- Magical spells with the typical INT mod
    blue_magic_maps.Magical = S{'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb','Spectral Floe','Tenebral Crush','Searing Tempest',
		'Anvil Lightning','Scouring Spate','Blinding Fulgor','Entomb'}

    -- Magical spells with a primary MND mod
    blue_magic_maps.MagicalMnd = S{'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'}

    -- Magical spells with a primary CHR mod
    blue_magic_maps.MagicalChr = S{'Eyes On Me','Mysterious Light'}

    -- Magical spells with a VIT stat mod (on top of INT)
    blue_magic_maps.MagicalVit = S{'Thermal Pulse'}

    -- Magical spells with a DEX stat mod (on top of INT)
    blue_magic_maps.MagicalDex = S{'Charged Whisker','Gates of Hades'}
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add INT for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'}
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'}

    -- Stun spells
    blue_magic_maps.Stun = S{'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'}
        
    -- Healing spells
    blue_magic_maps.Healing = S{'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral',
		'White Wind','Wild Carrot'}
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body',
		'Plasma Charge','Pyric Bulwark','Reactor Cool',}

    -- Other general buffs
    blue_magic_maps.Buff = S{'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'}
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'}
		
    determine_haste_group()
end

function user_setup()
    state.OffenseMode:options('Normal', 'MidAcc', 'HighAcc', 'Learning')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'MagicBurst')
    state.IdleMode:options('Normal', 'Learning')

	send_command('bind ^f1 ja UnbridledLearning') --MX1--
	send_command('bind ^f2 ja Diffusion') --MX2--
	send_command('bind ^f3 ja BurstAffinity') --MX3--
	send_command('bind ^f4 ja ChainAffinity') --MX4--
	send_command('bind ^f5 ja Efflux') --MX5--
	
	send_command('bind ^f6 ma MagicFruit st') --MX6--
	send_command('bind ^f7 ') --MX7--
	send_command('bind ^f8') --MX8--
	send_command('bind ^f9') --MX9--
	send_command('bind ^f10') --MX10--
	
	send_command('bind !f1 ws ChantduCygne') --M1--
	send_command('bind !f2 ws SavageBlade') --M2--
	send_command('bind !f3 ws SanguineBlade') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws Requiescat') --M4--
	
	send_command('bind !f6 gs c cycle Runes') --M5--
	send_command('bind !f7 gs c toggle UseRune') --M6--
	send_command('bind !f8') --M7--
	send_command('bind !f9') --M8--

    update_combat_form()
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
	
    Rosmerta = {}
    Rosmerta.TP = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    Rosmerta.WS = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	
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
	
    sets.TreasureHunter = {waist="Chaac Belt"}
	
	sets.midcast.Trust = {}
    sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {body="Apururu Unity shirt"})
	
	sets.Warp = {ring1="Warp Ring"}
	
    sets.latent_refresh = {waist="Fucho-no-obi"}
	
    --------------------------------------
    -- Job Abilties
    --------------------------------------
	
	--sets.buff['Burst Affinity'] = {feet="Hashishin Basmak"}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk",} --feet="Assimilator's charuqs +1"
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Efflux = {legs="Hashishin Tayt"}

    sets.precast.JA['Azure Lore'] = {hands="Luhlaza Bazubands +1"}
	sets.precast.JA['Swipe'] = {
		ammo="Pemphredo Tathlum",
        head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
        body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
		back="Seshaw Cape",
		waist=gear.ElementalObi,
		legs="Gyve Trousers",
		feet="Amalric Nails"}
	sets.precast.JA['Lunge'] = sets.precast.JA['Swipe']
	
    sets.precast.Waltz = {}

    sets.precast.Waltz['Healing Waltz'] = {}
    
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
    sets.precast.FC = {
		ammo="Impatiens",
		head=HerculeanHead.DW, --Carmine Mask--
		neck="Jeweled Collar",
		ear1="Loquacious Earring",
		ear2="Etiolation Earring",
		body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Prolix Ring",
		ring2="Weatherspoon ring",
		back="Swith Cape +1",
		waist="Witful Belt",
		legs="Psycloth Lappas",
		feet="Amalric Nails"} --Carmine Greaves--
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan"})

    --------------------------------------
    -- Weaponskill sets
    --------------------------------------
	
    sets.precast.WS = {}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS)
	
	sets.precast.WS['Chant du Cygne'] = {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Abnoba Kaftan",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Begrudging Ring",
		back=Rosmerta.WS,
		waist=gear.ElementalBelt,
		legs="Samnuha Tights",
		feet="Thereoid Greaves"}
		
	sets.precast.WS['Chant du Cygne'].Acc = {
		ear1="Cessance Earring",
		ring1="Ramuh Ring +1"}

    sets.precast.WS['Requiescat'] = {
		ammo="Quartz Tathlum +1",
		--head="Carmine Mask +1",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		--body="Carmine Scale Mail +1",
		--hands="Carmine Finger Gauntlets +1",
		ring1="Epona's Ring",
		ring2="Rufescent Ring",
		back="Bleating Mantle",
		waist=gear.ElementalBelt,
		--legs="Carmine Cuisses +1",
		--feet="Carmine Greaves +1"
		}
		
    sets.precast.WS['Savage Blade'] = {
		ammo="Floestone",
		head="Lilitu Headpiece",
		neck=gear.ElementalGorget, --neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Ifrit Ring",
		ring2="Rufescent Ring",
		back=Rosmerta.WS,
		waist=gear.ElementalBelt, --waist="Grunfeld rope",
		legs="Samnuha Tights",
		feet="Adhemar Gamashes"}

    sets.precast.WS['Sanguine Blade'] = {}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
    sets.midcast.FastRecast = sets.precast.FC
        
    sets.midcast['Blue Magic'] = {}

    --- Midcast sets // Physical Spells
	
    sets.midcast['Blue Magic'].Physical = {
		ammo="Floestone",
		head="Dampening Tam",
		--neck="Caro Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		body="Despair Mail",
		hands="Adhemar Wristbands",
		ring1="Rufescent Ring",
		ring2="Ifrit Ring",
		back="Cornflower Cape",
		--waist="Prosilio belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}

    sets.midcast['Blue Magic'].PhysicalAcc = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalStr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {
		ammo="Jukukik Feather",
		neck="Moepapa Medal",
		ring1="Apate Ring",
		ring2="Ramuh Ring +1",
		waist="Artful Belt +1",
		feet=HerculeanFeet.WSDEX})

    sets.midcast['Blue Magic'].PhysicalVit = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalAgi = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalInt = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalMnd = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalChr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalHP = sets.midcast['Blue Magic'].Physical

    --- Midcast sets // Magical Spells 
	
    sets.midcast['Blue Magic'].Magical = {
		ammo="Pemphredo Tathlum",
        head=HerculeanHead.Nuke,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
        body="Amalric Doublet",
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
        back="Cornflower Cape",
		waist=gear.ElementalObi,
		legs="Gyve Trousers",
		feet="Amalric Nails"}

    sets.midcast['Blue Magic'].Magical.MagicBurst = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Mujin Band",back="Seshaw Cape",})
    
    sets.midcast['Blue Magic'].MagicalMnd = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalChr = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalVit = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalDex = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicAccuracy = {
		ammo="Pemphredo Tathlum",
        head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Etiolation Earring",
        body="Amalric Doublet",
		hands="Leyline Gloves",
		ring1="Weatherspoon Ring",
		ring2="Sangoma Ring",
        back="Cornflower Cape",
		waist="Eschan Stone",
		legs="Psycloth Lappas",
		feet="Amalric Nails"}

    --- Midcast sets // Breath Spells

    sets.midcast['Blue Magic'].Breath = {}

    --- Midcast sets // Other Types
	
    sets.midcast['Blue Magic'].Stun = sets.midcast['Blue Magic'].MagicAccuracy
        
    sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Falcon Eye",
		head="Rawhide Mask",
		neck="Sanctity Necklace",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Adhemar Jacket",
		hands="Telchine Gloves", 
		ring1="Gelatinous Ring +1",
		--ring2="",
		back="Xucau Mantle",
		waist="Eschan Stone",
		legs="Telchine Braconi",
		feet="Luhlaza Charuqs +1"}
	
    sets.midcast['Blue Magic']['Battery Charge'] = {back="Grapevine Cape",waist="Gishdubar Sash"}

    sets.midcast['Blue Magic'].Healing = {
		ammo="Hydrocera",
		--head="Carmine Mask",
		neck="Incanter's Torque",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		ring1="Sirona's Ring",
		ring2="Rufescent Ring",
		back="Tempered Cape +1",
		waist="Pythia Sash +1",
		legs="Gyve Trousers",
		feet="Medium's Sabots"}
	
    sets.self_healing = {
		ammo="Hydrocera",
		--head="Carmine Mask",
		neck="Incanter's Torque",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		ring1="Sirona's Ring",
		ring2="Rufescent Ring",
		back="Tempered Cape +1",
		waist="Gishdubar Sash",
		legs="Gyve Trousers",
		feet="Medium's Sabots"}
		
    sets.Learning = {
		head="Luhlaza Keffiyeh +1",
		neck="Incanter's Torque",
		body="Assim. Jubbah +1",
		hands="Assimilator's Bazubands +1",
		legs="Hashishin tayt",
		back="Cornflower Cape",}	
    
	sets.midcast['Blue Magic'].SkillBasedBuff = {
		--ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh +1",
		neck="Incanter's Torque",
        body="Assimilator's Jubbah +1",
		hands="Rawhide Gloves",
        back="Cornflower Cape",
		legs="Hashishin tayt",
		feet="Luhlaza Charuqs +1"}
		
	sets.midcast['Blue Magic'].Buff = sets.midcast['Blue Magic'].SkillBasedBuff

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	
    sets.resting = {}

    sets.idle = {
		ammo="Vanir Battery",
		head="Rawhide Mask",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Mekosu. Harness",
		hands="Serpentes Cuffs",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		legs="Gyve Trousers",
		feet="Serpentes Sabots"}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)
	
    sets.idle.PDT = set_combine(sets.idle)

    sets.idle.Town = set_combine(sets.idle)
	
    sets.idle.Town.Adoulin = set_combine(sets.idle, {body="Councilor's Garb"})

    sets.defense.PDT = {
		ammo="Vanir Battery",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Shadow Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet=HerculeanFeet.TA}

    sets.defense.MDT = {
		ammo="Vanir Battery",
		head="Dampening Tam",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		body="Samnuha Coat",
		hands="Iuitl Wristbands +1",
		ring1="Purity Ring",
		ring2="Defending Ring",
		back="Engulfer Cape +1",
		waist="Flax Sash",
		legs="Gyve Trousers",
		feet="Amalric Nails"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------
	
    sets.engaged = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Rosmerta.TP,
		waist="Windbuffet Belt +1", --Shetal Stone
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
    sets.engaged.MidAcc = set_combine(sets.engaged , {
		ammo="Falcon Eye",
		neck="Sanctity Necklace",})
    sets.engaged.HighAcc = set_combine(sets.engaged , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		hands="Leyline Gloves",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1"})

    sets.engaged.HighHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Rosmerta.TP,
		waist="Windbuffet Belt +1", --Shetal Stone
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.HighHaste , {
		ammo="Falcon Eye",
		neck="Sanctity Necklace",})
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.HighHaste , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		hands="Leyline Gloves",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1"})

    sets.engaged.MaxHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back=Rosmerta.TP,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
	sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {
		ammo="Falcon Eye",
		ear1="Cessance Earring",
		waist="Kentarch Belt +1"})
    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		hands="Leyline Gloves",
		ring2="Ramuh Ring +1",
		waist="Kentarch Belt +1"})
    
	sets.engaged.DW = sets.engaged
    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)
end

function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
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

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end

function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    meleeSet = set_combine(meleeSet)
    return meleeSet
end

function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        update_combat_form()
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

function customize_idle_set(idleSet)
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end

function job_buff_change(buff, gain)
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

function job_update(cmdParams, eventArgs)
    local res = require('resources')
    local info = windower.ffxi.get_info()
    local zone = res.zones[info.zone].name
    if state.Moving.value == true then
        if zone:match('Adoulin') then
            equip(sets.Adoulin)
        end
    end
    update_combat_form()
    determine_haste_group()
    th_update(cmdParams, eventArgs)
    run_sj = player.sub_job == 'RUN' or false
end

function update_combat_form()
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end

function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
	if ( ( (buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604]) ) or
		   ( buffactive[33] and (buffactive[580] or buffactive.embrava) ) or
		   ( buffactive.march == 2 and buffactive[604] ) ) then
		 	--add_to_chat(8, '-- Max-Haste --')
				classes.CustomMeleeGroups:append('MaxHaste')
	elseif ( (buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba'] ) then
			--add_to_chat(8, '-- Haste 35% --')
			classes.CustomMeleeGroups:append('HighHaste')
	elseif ( ( buffactive[580] or buffactive[33] or buffactive.march == 2 ) or
			 ( buffactive.march == 1 and buffactive[604] ) ) then
			--add_to_chat(8, '-- Haste 30% --')
			classes.CustomMeleeGroups:append()
	elseif ( buffactive.march == 1 or buffactive[604] ) then
			--add_to_chat(8, '-- Haste 15% --')
            classes.CustomMeleeGroups:append()
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
        add_to_chat(8, '--- Warping ---')
        --equip({ring1="Warp Ring"})
        send_command('input //gs equip sets.Warp; @wait 9; input /item "Warp Ring" <me>;')
    end
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

function job_get_spell_map(spell, default_spell_map)
    if spell.type == 'Trust' then
        return 'Trust'
    end
end

function select_default_macro_book()
    if player.sub_job == 'RUN' then
        set_macro_page(3, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 7)
    else
        set_macro_page(1, 7)
    end
end
