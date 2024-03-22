local cargo_wagon = data.raw["cargo-wagon"]["cargo-wagon"]
local steel_chest = data.raw["container"]["steel-chest"]

if not cargo_wagon then
    error "Prototype `cargo-wagon.cargo-wagon`, which is required by this mod, not found."
end

if not steel_chest then
    error "Prototype `container.steel-chest`, which is required by this mod, not found."
end

local inventory_size = 3 * steel_chest.inventory_size
cargo_wagon["inventory_size"] = inventory_size
