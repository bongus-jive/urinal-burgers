function init()
	if storage.burger == nil then
		storage.burger = true
	end
	setBurger()
	
	storage.variant = storage.variant or math.random(1, 2)
	animator.setGlobalTag("variant", storage.variant)
end

function onInteraction()
	spawnBurger()
	storage.burger = false
	setBurger()
end

function die()
	spawnBurger()
end


function setBurger()
	animator.setAnimationState("burger", tostring(not not storage.burger))
	object.setInteractive(storage.burger)
end

function spawnBurger()
	if storage.burger then
		world.spawnItem("hamburger", entity.position())
	end
end