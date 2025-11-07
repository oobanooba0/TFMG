---yet another bit of code borrowed from cupric asteroids.
local particle_animations = {}

--ferric-asteroid-particles

particle_animations.get_ferric_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-small.png",
      priority = "extra-high",
      width = 14,
      height = 16,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_ferric_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 22,
      height = 20,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_ferric_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-big.png",
      priority = "extra-high",
      width = 36,
      height = 36,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_ferric_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 62,
      height = 56,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.5, 2.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_ferric_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/metallic-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 82,
      height = 86,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.0, 2.5), options.shift),
      scale = options.scale or 0.5
    }
  }
end

--crystalline particles

particle_animations.get_crystalline_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__TFMG-assets-0__/particle/asteroid-particle/crystalline-asteroid/crystalline-asteroid-particle-small.png",
      priority = "extra-high",
      width = 12,
      height = 12,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_crystalline_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__TFMG-assets-0__/particle/asteroid-particle/crystalline-asteroid/crystalline-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 18,
      height = 16,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_crystalline_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__TFMG-assets-0__/particle/asteroid-particle/crystalline-asteroid/crystalline-asteroid-particle-big.png",
      priority = "extra-high",
      width = 38,
      height = 36,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_crystalline_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__TFMG-assets-0__/particle/asteroid-particle/crystalline-asteroid/crystalline-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 32,
      height = 36,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.5, 2.0), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_crystalline_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return {
    sheet = {
      filename = "__TFMG-assets-0__/particle/asteroid-particle/crystalline-asteroid/crystalline-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 82,
      height = 84,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2.0, 2.5), options.shift),
      scale = options.scale or 0.5
    }
  }
end

--volatile particles
particle_animations.get_volatile_asteroid_particle_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-small.png",
      priority = "extra-high",
      width = 16,
      height = 18,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.6
    }
  }
end

particle_animations.get_volatile_asteroid_particle_medium_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-medium.png",
      priority = "extra-high",
      width = 28,
      height = 22,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.5
    }
  }
end

particle_animations.get_volatile_asteroid_particle_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-big.png",
      priority = "extra-high",
      width = 44,
      height = 38,
      frame_count = 12,
      animation_speed = 0.3,
      variation_count = 10,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0,0.5), options.shift),
      scale = 0.6
    }
  }
end
particle_animations.get_volatile_asteroid_particle_top_small_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-top-small.png",
      priority = "extra-high",
      width = 70,
      height = 52,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 0.0), options.shift),
      scale = 0.5
    }
  }
end
particle_animations.get_volatile_asteroid_particle_top_big_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__space-age__/graphics/particle/asteroid-particle/oxide-asteroid-particle-top-big.png",
      priority = "extra-high",
      width = 90,
      height = 88,
      frame_count = 16,
      animation_speed = 0.2,
      variation_count = 6,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(0.0, 1.0), options.shift),
      scale = options.scale or 0.5
    }
  }
end

return particle_animations
