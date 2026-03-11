--this should basically swap all instances of "pressure" for "TFMG-pressure"
--this is necessary due to how bot efficiency is tied to pressure, and I don't like that.

for _,planet in pairs(data.raw.planet) do
  planet.surface_properties["TFMG-pressure"] = planet.surface_properties["TFMG-pressure"] or planet.surface_properties.pressure
  if planet.surface_properties["bot-usage"] and planet.surface_properties.gravity then
    planet.surface_properties.pressure = (planet.surface_properties.gravity * 100 / planet.surface_properties["bot-usage"])
  end
end