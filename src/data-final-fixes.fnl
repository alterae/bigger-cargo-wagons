(when (and _G.data.raw.cargo-wagon.cargo-wagon
           _G.data.raw.container.steel-chest)
  (let [inventory-size (* 3 _G.data.raw.container.steel-chest.inventory_size)]
    (tset _G.data.raw.cargo-wagon.cargo-wagon :inventory_size inventory-size)))
