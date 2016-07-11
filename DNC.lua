function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
end

function job_setup()
    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false

    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
    state.UseAltStep = M(false, 'Use Alt Step')
    state.SelectStepTarget = M(false, 'Select Step Target')
    state.IgnoreTargetting = M(false, 'Ignore Targetting')

    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
    state.SkillchainPending = M(false, 'Skillchain Pending')

    determine_haste_group()
end

function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')

	send_command('bind ^f1') --MX1--
	send_command('bind ^f2') --MX2--
	send_command('bind ^f3') --MX3--
	send_command('bind ^f4') --MX4--
	send_command('bind ^f5') --MX5--
	send_command('bind ^f6') --MX6--
	
	send_command('bind ^f7') --MX7--
	send_command('bind ^f8') --MX8--
	send_command('bind ^f9') --MX9--
	send_command('bind ^f10') --MX10--
	
	send_command('bind !f1') --M1--
	send_command('bind !f2') --M2--
	send_command('bind !f3') --M3--
	--send_command('bind !f4')
	send_command('bind !f5') --M4--
	
	send_command('bind !f6 gs c cycle mainstep') --M5--
	send_command('bind !f7 gs c toggle selectsteptarget') --M6--
	send_command('bind !f8 gs c cycle altstep') --M7--
	send_command('bind !f9 gs c toggle usealtstep') --M8--

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
	HerculeanLegs.Nuke = {name="Herculean Trousers", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+4%','STR+9','Mag. Acc.+5','"Mag.Atk.Bns."+15',}}
	
	HerculeanFeet = {}
	HerculeanFeet.DW = {name="Herculean Boots", augments={'Accuracy+24','"Dual Wield"+5','AGI+1','Attack+6',}}
	HerculeanFeet.TA = {name="Herculean Boots", augments={'Attack+26','"Triple Atk."+4','AGI+7','Accuracy+11',}}
	HerculeanFeet.WSDEX = {name="Herculean Boots", augments={'Attack+25','Weapon skill damage +2%','DEX+13','Accuracy+2',}}
	HerculeanFeet.WSAGI = {}
	HerculeanFeet.Nuke = {}
	
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff['Saber Dance'] = {legs="Horos Tights"}
    sets.buff['Climactic Flourish'] = {head="Charis Tiara +2"}
	
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
	sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}
    sets.precast.JA['Trance'] = {head="Horos Tiara"}

    sets.precast.Waltz = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}
        
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara"}

    sets.precast.Jig = {legs="Horos Tights", feet="Maxixi Toe Shoes"}

    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Step['Feather Step'] = {feet="Charis Shoes +2"}

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Horos Casaque",hands="Buremte Gloves",ring2="Sangoma Ring",
        waist="Chaac Belt",legs="Iuitl Tights",feet="Iuitl Gaiters +1"} -- magic accuracy
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="Charis Feather",
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Horos Casaque",hands="Buremte Gloves",ring1="Beeline Ring",
        back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"} -- acc gear

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +2"}
    
    sets.precast.FC = {ammo="Impatiens",head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    --------------------------------------
    -- Weaponskill sets
    --------------------------------------
	
    sets.precast.WS = {}
    sets.precast.WS.Acc = sets.precast.WS

    sets.precast.WS['Exenterator'] = sets.precast.WS

    sets.precast.WS['Pyrrhic Kleos'] = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

    sets.precast.WS['Evisceration'] = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

    sets.precast.WS["Rudra's Storm"] = {
		ammo="Jukukik Feather",
		head="Lilitu Headpiece",
		neck="Moepapa Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		body="Adhemar Jacket",
		hands="Meghanada gloves +1",
		ring1="Epona's Ring",
		ring2="Ramuh Ring +1",
		back="Kayapa Cape",
		waist="Artful Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.WSDEX}

    sets.precast.WS['Aeolian Edge'] = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}
    
    sets.precast.Skillchain = {hands="Charis Bangles +2"}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
    sets.midcast.FastRecast = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

    sets.midcast.Utsusemi = {
		ammo="",
		head="",
		neck="",
		ear1="",
		ear2="",
		body="",
		hands="",
		ring1="",
		ring2="",
		back="",
		waist="",
		legs="",
		feet=""}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	
    sets.resting = {}

    sets.idle = {
		ammo="Staunch Tathlum",
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
		feet="Tandava Crackows"}

    sets.idle.Town = sets.idle
    
    sets.idle.Weak = sets.idle

    sets.defense.Evasion = sets.idle

    sets.defense.PDT = {
		ammo="Staunch Tathlum",
        head="Iuitl Headgear +1",
		neck="Twilight Torque",
        body="Emet Harness +1",
		hands="Iuitl Wristbands",
		ring1="Patricius Ring",
		ring2="Dark Ring",
        back="Shadow Mantle",
		waist="Flume Belt",
		legs="Iuitl Tights +1",
		feet=""}

    sets.defense.MDT = {
		ammo="Staunch Tathlum",
        head="Wayfarer Circlet",
		neck="Twilight Torque",
        body="Qaaxo Harness",
		hands="Wayfarer Cuffs",
		ring1="Defending Ring",
		ring2="Shadow Ring",
        back="Engulfer Cape",
		waist="Flume Belt",
		legs="Wayfarer Slops",
		feet="Wayfarer Clogs"}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
	
    sets.engaged = {
		ammo="Ginsen",
		head=HerculeanHead.DW,
		neck="Asperity Necklace",
		ear1="Eabani Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Toetapper Mantle",
		waist="Patentia Sash",
		legs=HerculeanLegs.DW,
		feet=HerculeanFeet.DW}
    sets.engaged.MidAcc = set_combine(sets.engaged , {})
    sets.engaged.HighAcc = set_combine(sets.engaged , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		ring1="Ramuh Ring +1",
		waist="Kentarch Belt +1"})

    sets.engaged.HighHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="Toetapper Mantle",
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.HighHaste , {
		ear1="Cessance Earring",
		waist="Kentarch Belt +1"})
	sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.HighHaste , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		ring1="Ramuh Ring +1",
		waist="Kentarch Belt +1"})

    sets.engaged.MaxHaste = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body="Adhemar Jacket",
		hands=HerculeanHands.TA,
		ring1="Epona's Ring",
		ring2="Petrov Ring",
		back="",
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet=HerculeanFeet.TA}
	sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {
		ear1="Cessance Earring",
		waist="Kentarch Belt +1"})
    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.MaxHaste , {
		ammo="Falcon Eye",
		head="Dampening Tam",
		neck="Sanctity Necklace",
		ear1="Cessance Earring",
		ear2="Dignitary's Earring",
		ring1="Ramuh Ring +1",
		waist="Kentarch Belt +1"})
end

function job_precast(spell, action, spellMap, eventArgs)
    auto_presto(spell)
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.SkillchainPending.value == true then
            equip(sets.precast.Skillchain)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Wild Flourish" then
            state.SkillchainPending:set()
            send_command('wait 5;gs c unset SkillchainPending')
        elseif spell.type:lower() == "weaponskill" then
            state.SkillchainPending:toggle()
            send_command('wait 6;gs c unset SkillchainPending')
        end
    end
end

function job_buff_change(buff,gain)
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif buff == 'Saber Dance' or buff == 'Climactic Flourish' then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Engaged' then
        determine_haste_group()
    end
end

function job_update(cmdParams, eventArgs)
    determine_haste_group()
end


function customize_idle_set(idleSet)
    if player.hpp < 80 and not areas.Cities:contains(world.area) then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.DefenseMode.value ~= 'None' then
        if buffactive['saber dance'] then
            meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
        end
        if state.Buff['Climactic Flourish'] then
            meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
        end
    end
    
    return meleeSet
end

function job_auto_change_target(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        if state.IgnoreTargetting.value == true then
            state.IgnoreTargetting:reset()
            eventArgs.handled = true
        end
        
        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
    end
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
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', ['..state.MainStep.current

    if state.UseAltStep.value == true then
        msg = msg .. '/'..state.AltStep.current
    end
    
    msg = msg .. ']'

    if state.SelectStepTarget.value == true then
        steps = steps..' (Targetted)'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'step' then
        if cmdParams[2] == 't' then
            state.IgnoreTargetting:set()
        end

        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current..'Step'].current
            state.CurrentStep:cycle()
        else
            doStep = state.MainStep.current
        end        
        
        send_command('@input /ja "'..doStep..'" <t>')
    end
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

function auto_presto(spell)
    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
    end
end

function select_default_macro_book()
    if player.sub_job == 'WAR' then
        set_macro_page(3, 20)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 20)
    else
        set_macro_page(5, 20)
    end
end
