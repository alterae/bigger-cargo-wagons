(local cargo-wagon _G.data.raw.cargo-wagon.cargo-wagon)
(local steel-chest _G.data.raw.container.steel-chest)

(if (and cargo-wagon steel-chest)
    (let [inventory-size (* 3 steel-chest.inventory_size)]
      (tset cargo-wagon :inventory_size inventory-size))
    cargo-wagon
    (error "Prototype `cargo-wagon.cargo-wagon`, which is required by this mod, not found.")
    steel-chest
    (error "Prototype `container.steel-chest`, which is required by this mod, not found.")
    (error "Prototypes `cargo-wagon.cargo-wagon` and `container.steel-chest`, which are required by this mod, not found."))
