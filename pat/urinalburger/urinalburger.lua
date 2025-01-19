function init()
  if storage.burger == nil then
    storage.burger = true
  end
  updateBurgerState()

  storage.variant = storage.variant or math.random(config.getParameter("burgerVariants"))
  animator.setGlobalTag("variant", storage.variant)
end

function onInteraction()
  storage.burger = false
  updateBurgerState()
  spawnBurger()
end

function die()
  spawnBurger()
end

function updateBurgerState()
  animator.setAnimationState("burger", tostring(not not storage.burger))
  object.setInteractive(storage.burger)
end

function spawnBurger()
  if storage.burger then
    world.spawnItem(config.getParameter("burgerItem"), entity.position())
  end
end
