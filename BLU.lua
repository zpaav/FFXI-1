function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
    include('organizer-lib')
end

function job_setup()
    include('Mote-TreasureHunter')
	
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    state.Buff.Doom = buffactive.Doom or false
    state.TreasureMode:set('Tag')
	
	gear.default.obi_waist = "Eschan Stone"

    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}

    --------------------------------------
    -- Physical Spells
    --------------------------------------    
	
	blue_magic_maps = {}
    blue_magic_maps.Physical = S{'Bilgestorm'}
    blue_magic_maps.PhysicalAcc = S{'Heavy Strike'}
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Spinal Cleave',
        'Uppercut','Vertical Cleave','Sinker Drill'}
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'}     
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'}
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'}
    blue_magic_maps.PhysicalInt = S{'Mandibular Bite','Queasyshroom'}
    blue_magic_maps.PhysicalMnd = S{'Ram Charge','Screwdriver','Tourbillion'}
    blue_magic_maps.PhysicalChr = S{'Bludgeon'}
    blue_magic_maps.PhysicalHP = S{'Final Sting'}

    --------------------------------------
    -- Magical Spells
    --------------------------------------
	
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Droning Whirlwind','Embalming Earth','Firespit','Foul Waters','Ice Break',
        'Leafstorm','Maelstrom','Regurgitation','Rending Deluge',
        'Subduction','Tem. Upheaval','Water Bomb',
		'Searing Tempest', 'Spectral Floe', 'Scouring Spate', 'Anvil Lightning', 
		'Silent Storm', 'Molting Plumage', 'Nectarous Deluge'}
    blue_magic_maps.MagicalMnd = S{'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'}
    blue_magic_maps.MagicalChr = S{'Eyes On Me','Mysterious Light'}
    blue_magic_maps.MagicalVit = S{'Thermal Pulse'}
    blue_magic_maps.MagicalDex = S{'Charged Whisker','Gates of Hades'}            
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'}
    blue_magic_maps.MagicDark = S{'Blood Saber','Palling Salvo','Tenebral Crush','Osmosis','Atra. Libations'}
	blue_magic_maps.MagicLight = S{'Blinding Fulgor','Diffusion Ray','Rail Cannon','Retinal Glare','Magic Hammer'}
	blue_magic_maps.MagicEarth = S{'Entomb'}
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'}
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'}
    blue_magic_maps.Healing = S{'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Wild Carrot'}
    blue_magic_maps.SkillBasedBuff = S{
        'Diamondhide','Magic Barrier','Metallic Body','Plasma Charge','Reactor Cool', 'Occultation'}
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Barrier Tusk','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Orcish Counterstance','Pyric Bulwark','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'}
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Droning Whirlwind','Gates of Hades','Harden Shell','Pyric Bulwark','Thunderbolt',
        'Tourbillion','Mighty Guard'}	
    determine_haste_group()
end

function user_setup()
    state.OffenseMode:options('Normal','MidAcc','HighAcc')
    state.HybridMode:options('Normal','PDT','Meva')
    state.WeaponskillMode:options('Normal','Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
		
	state.RuneMode = M('None','Lux','Tenebrae','Ignis','Gelus','Flabra','Tellus','Sulpor','Unda')
    state.MagicBurst = M(false, 'Magic Burst')

	send_command('bind ^f1 ja Diffusion') --MX1--
	send_command('bind ^f2 ja BurstAffinity') --MX2--
	send_command('bind ^f3 input //berserk;wait 1;//aggressor') --MX3--
	send_command('bind ^f4 input //Efflux;wait 1;//ChainAffinity') --MX4--
	send_command('bind ^f5') --MX5--
	send_command('bind ^f6 ma MagicFruit st') --MX6--
	send_command('bind ^f7 ma MightyGuard') --MX7--
	send_command('bind ^f8 ma CarcharianVerve') --MX8--
	send_command('bind ^f9') --MX9--
	send_command('bind ^f10') --MX10--
	
	send_command('bind !f1 ws ChantduCygne') --M1--
	send_command('bind !f2 ws SavageBlade') --M2--
	send_command('bind !f3 ws SanguineBlade') --M3--
	--send_command('bind !f4')
	send_command('bind !f5 ws Requiescat') --M4--
	send_command('bind !f6 ja Unda') --M5--
	send_command('bind !f7 gs c cycle RuneMode') --M6--
	send_command('bind !f8 gs c toggle MagicBurst') --M7--
	send_command('bind !f9 gs c cycle treasuremode') --M8--
	
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
	
    --------------------------------------
    -- Job Abilties Sets
    --------------------------------------
	
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}
    sets.buff['Burst Affinity'] = {} --legs="Assimilator's Shalwar",feet="Hashishin Basmak",
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk",} --feet="Assimilator's charuqs +1"
    sets.buff.Convergence = {head="Mirage Keffiyeh +2"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Efflux = {legs="Hashishin Tayt"}
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}
	sets.precast.JA['Lunge'] = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
        back="Cornflower Cape",
		waist=gear.ElementalObi,
		legs="Amalric Slops",
		feet="Amalric Nails"}
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	
    --------------------------------------
    -- Idle Sets
    --------------------------------------
	
    sets.idle = {
		ammo="Staunch Tathlum",
		head="Rawhide Mask",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		body="Jhakri Robe +1",
		hands="Serpentes Cuffs",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet="Serpentes Sabots"}
    sets.idle.PDT = sets.idle
	sets.idle.Refresh = sets.idle
	sets.idle.Town = sets.idle
	
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.precast.FC = {
		ammo="Impatiens",
		head="Amalric Coif", --10
		neck="Jeweled Collar", --3
		ear1="Loquacious Earring", --2
		ear2="Etiolation Earring", --1
		body="Dread Jupon", --7
		hands="Leyline Gloves", --8
		ring1="Prolix Ring", --2
		ring2="Weatherspoon ring", --5
		back="Swith Cape +1", --4
		waist="Witful Belt", --3
		legs="Psycloth Lappas", --7
		feet="Amalric Nails"} --5
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan"})
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Blue Magic'] = {}
    
    --- Midcast sets // Physical Spells
    
    sets.midcast['Blue Magic'].Physical = {
		ammo="Floestone",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Ifrit Ring",
		ring2="Rufescent Ring",
		back="Cornflower Cape",
		waist="Grunfeld Rope",
		legs="Samnuha Tights",
		feet="Jhakri Pigaches +1"}
    sets.midcast['Blue Magic'].PhysicalAcc = {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Zennaroi Earring",
		ear2="Dignitary's Earring",
		body="Adhemar Jacket",
		hands="Leyline Gloves",
		ring1="Ramuh Ring +1",
		ring2="Petrov Ring",
		back=Rosmerta.TP,
		waist="Kentarch Belt +1",
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,{})
    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,{
		ammo="Jukukik Feather",
		ring1="Apate Ring",
		ring2="Ramuh Ring +1",
		feet=HerculeanFeet.WSDEX})
    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,{})
    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,{})
    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,{})		
    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,{})		
    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,{})
    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)

    --- Midcast sets // Magical Spells 
    
    sets.midcast['Blue Magic'].Magical = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Acumen Ring",
        back="Cornflower Cape",
		waist=gear.ElementalObi,
		legs="Amalric Slops",
		feet="Amalric Nails"}
    sets.magic_burst = {body="Samnuha Coat",ring2="Mujin band",back="Seshaw cape"}
    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{})    
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,{})
    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical,{})
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,{})
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical,{})
    sets.midcast['Blue Magic'].MagicAccuracy = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		ear1="Dignitary's Earring",
		ear2="Etiolation Earring",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Weatherspoon Ring",
		ring2="Stikini Ring",
        back="Cornflower Cape",
		waist=gear.ElementalObi,
		legs="Jhakri Slops +1",
		feet="Amalric Nails"}
	sets.midcast['Blue Magic'].MagicDark = set_combine(sets.midcast['Blue Magic'].Magical,{ring2="Archon Ring"}) --head="Pixie Hairpin +1",
	sets.midcast['Blue Magic'].MagicLight = set_combine(sets.midcast['Blue Magic'].Magical,{ring2="Weatherspoon ring"})
	sets.midcast['Blue Magic'].MagicEarth = set_combine(sets.midcast['Blue Magic'].Magical,{})
    sets.midcast['Blue Magic'].Breath = set_combine(sets.midcast.FastRecast,{})
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,{})   
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
    sets.midcast['Blue Magic'].Healing = sets.midcast.Cure
    sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.midcast.FastRecast,{
		--ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh +1",
		neck="Incanter's Torque",
        body="Assimilator's Jubbah +1",
		hands="Rawhide Gloves",
		ring1="Stikini Ring",
        back="Cornflower Cape",
		legs="Hashishin tayt",
		feet="Luhlaza Charuqs +1"})
    sets.midcast['Blue Magic'].Buff = set_combine(sets.midcast.FastRecast,{})
	sets.midcast.Cure = {
		ammo="Hydrocera",
		head="Jhakri Coronal +1",
		neck="Incanter's Torque",
		ear1="Medicant's Earring",
		ear2="Handler's Earring",
		body="Vrikodara Jupon",
		hands="Jhakri Cuffs +1",
		ring1="Sirona's Ring",
		ring2="Rufescent Ring",
		back="Tempered Cape +1",
		waist="Pythia Sash +1",
		legs="Gyve Trousers",
		feet="Medium's Sabots"}
    sets.midcast.self_healing = set_combine(sets.midcast.Cure,{
		--neck="Phalaina locket",
		--hands="Buremte Gloves",
		ring1="Asklepian Ring",
		waist="Gishdubar sash"})	
	sets.midcast['Diaga'] = {waist="Chaac belt"}
	sets.midcast['Flash'] = sets.midcast['Diaga']
	sets.midcast['Glutinous Dart'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, sets.midcast['Diaga'])
	sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {})	
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar sash"})
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{head="Amalric Coif"})
	sets.midcast['Battery Charge'] = sets.midcast.Refresh
	sets.midcast['Carcharian Verve'] = sets.midcast.Aquaveil

    --------------------------------------
    -- Engaged Sets
    --------------------------------------

    sets.engaged = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=Rosmerta.TP,
		waist="Windbuffet Belt +1",
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

    sets.engaged.MidHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=Rosmerta.TP,
		waist="Windbuffet Belt +1",
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.MidHaste , {
		ammo="Falcon Eye",
		neck="Sanctity Necklace",})
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.MidHaste , {
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
		hands=AdhemarHands.B,
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
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
    --------------------------------------
    -- Weaponskill Sets
    --------------------------------------

    sets.precast.WS = {}
	sets.precast.WS['Chant du Cygne'] = {
		ammo="Jukukik Feather",
		head=HerculeanHead.CritDEX,
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Abnoba Kaftan",
		hands=AdhemarHands.B,
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
		ammo="Hydrocera",
		head="Jhakri Coronal +1",
		neck=gear.ElementalGorget,
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Epona's Ring",
		ring2="Rufescent Ring",
		back=Rosmerta.TP,
		waist=gear.ElementalBelt,
		legs="Carmine Cuisses +1",
		feet="Jhakri Pigaches +1"}
    sets.precast.WS['Savage Blade'] = {
		ammo="Floestone",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body=HerculeanBody.STRWS,
		hands=HerculeanHands.STRWS,
		ring1="Rajas Ring",
		ring2="Ifrit Ring",
		back=Rosmerta.WS,
		waist="Grunfeld rope",
		legs="Samnuha Tights",
		feet=HerculeanFeet.STRWS}
    sets.precast.WS['Judgment'] = {
		ammo="Floestone",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Ifrit Ring",
		ring2="Rufescent Ring",
		back=Rosmerta.WS,
		waist="Grunfeld rope",
		legs="Samnuha Tights",
		feet="Adhemar Gamashes"}
	
    --------------------------------------
    -- Misc Sets
    --------------------------------------
	
    sets.resting = {}
    sets.defense.PDT = {
		ammo="Staunch Tathlum",
		head="Iuitl Headgear +1",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Colossus's Earring",
		body="Emet Harness +1",
		hands="Iuitl Wristbands +1",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring",
		back="Xucau Mantle",
		waist="Flume Belt",
		--legs="Iuitl Tights +1",
		feet=HerculeanFeet.TA}
    sets.defense.MDT = {
		ammo="Staunch Tathlum",
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
	sets.defense.Meva = sets.defense.MDT
    sets.Kiting = {legs="Carmine Cuisses +1"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.buff.Doom = {ring1="Purity Ring",ring2="Saida Ring",waist="Gishdubar sash"}
end

function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <st>')
		add_to_chat(122, "Silenced, Auto-Echos")
    end
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = true
    end
end

function change_midcast(spell, action, spellMap, eventArgs)
end
	
function job_precast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = true
	end
	if buffactive['Terror'] or buffactive['Stun'] then
		eventArgs.cancel = true
		add_to_chat(122, "Unable to act, action cancelled")
		return	
	end
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>;wait 1.5;input /ma "'..spell.name..'" '..spell.target.name)
    end
	if spell.english == 'Lunge' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            send_command('input /jobability "Swipe" <t>')
            add_to_chat(122, '***Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.***')
            eventArgs.cancel = true
            return
        end
    end
	if spell.english == 'Circle Blade' and state.TreasureMode.value ~= 'None' then
		equip(sets.TreasureHunter)
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
		if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
			equip(sets.TreasureHunter)
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
	if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
		equip(sets.TreasureHunter)
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
		if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
			equip(sets.TreasureHunter)
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spellMap == 'Healing' or spellMap == 'Cure' then	
		if spell.target.type == 'SELF' then	
			if 'Light' == world.day_element or 'Light' == world.weather_element then
				equip(sets.midcast.self_healing)
				--add_to_chat(122, "Weather Cure Self")
			else 
				equip(sets.midcast.self_healing)
				--add_to_chat(122, "Cure Self")
			end
		else
			equip(sets.midcast.Cure)
			--add_to_chat(122, "Cure")
		end	
    elseif spell.skill == 'Blue Magic' and state.Buff.Diffusion then
		equip(sets.buff.Diffusion) 
	elseif spell.skill == 'Blue Magic' and spell.en ~= 'Mighty Guard' then
		if spell.en == 'White Wind' then
			equip(sets.midcast.self_healing)			
		elseif spellMap:startswith('Magic') then
		--add_to_chat(122, spellMap)
			if spell.element == world.day_element or spell.element == world.weather_element then
				if state.MagicBurst.value then
					equipSet=set_combine(equipSet,sets.magic_burst)			
					equipSet = set_combine(equipSet, {waist="Hachirin-No-Obi"})
					equip(equipSet)
					--add_to_chat(122, "Weather Magic Burst")
				else 
					equipSet = set_combine(equipSet, {waist="Hachirin-No-Obi"})
					equip(equipSet)
					--add_to_chat(122, "Weather Nuke")
				end
			elseif state.MagicBurst.value then
				equipSet=set_combine(equipSet,sets.magic_burst)		
				equip(equipSet)
				add_to_chat(122, "Magic Burst")
			end	
		end
	elseif spell.skill == 'Enhancing Magic' then		
		if spell.en == 'Aquaveil' then
			equip(sets.midcast.Aquaveil)
		elseif spell.en == 'Refresh' then
			equip(sets.midcast.Refresh)
		elseif spell.en == 'Phalanx' then
			equip(sets.midcast.Phalanx)
		else equip(sets.midcast['Enhancing Magic'])
		end
    elseif spell.skill == 'Elemental Magic' then
		equip(sets.midcast['Blue Magic'].Magical)
	end
end

function customize_melee_set(meleeSet)
	if state.TreasureMode.value == 'Fulltime' then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end
	return meleeSet
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
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
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

function job_buff_change(buff, gain)
    if S{'haste','march','mighty guard','embrava','haste samba','geo-haste','indi-haste'}:contains(buff:lower()) then
        determine_haste_group()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
	if buffactive['Haste'] then
        if buffactive['Mighty Guard'] and state.HybridMode.value == 'Normal' then
            state.CombatForm:set("Haste")
		else
			state.CombatForm:reset()
			update_combat_form()		
		end
    end
end	

function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
    update_combat_form()
    determine_haste_group()
end

function th_action_check(category, param)
	if category == 2 or
		(category == 3 and param == 30) or
		(category == 6 and info.default_ja_ids:contains(param)) or
		(category == 14 and info.default_u_ja_ids:contains(param))
		then return true
	end
end

function update_combat_form()
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end

function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        update_combat_form()
    end
end

function select_default_macro_book()
    if player.sub_job == 'THF' then
        set_macro_page(4, 7)
    elseif player.sub_job == 'BLM' then
        set_macro_page(5, 7)		
    elseif player.sub_job == 'RUN' then
        set_macro_page(3, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 7)
    else
        set_macro_page(1, 7)
    end
end
