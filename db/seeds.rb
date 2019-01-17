p "Deletando todas as entradas"
Ingrediente.all.each do |delete|
  delete.destroy
end

Burger.all.each do |delete|
  delete.destroy
end

Bebida.all.each do |delete|
  delete.destroy
end

p "Entradas deletadas"

p "Populando cardapio"

# Ingredientes
i = Ingrediente.new
i.nome = "Ground beef (300g)"
i.categoria = "Carnes"
i.preco_normal = 1.00
i.preco_extra = 1.00
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Filet Steak (250g)"
i.categoria = "Carnes"
i.preco_normal = 1.50
i.preco_extra = 1.50
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Bacon"
i.categoria = "Carnes"
i.preco_normal = 0.75
i.preco_extra = 0.75
i.possiveis_quantidades = ["None", "Normal", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Chicken breast (200g)"
i.categoria = "Carnes"
i.preco_normal = 0.75
i.preco_extra = 0.75
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Mozzarella cheese"
i.categoria = "Queijos"
i.preco_normal = 0.30
i.preco_extra = 0.30
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Cheddar cheese"
i.categoria = "Queijos"
i.preco_normal = 0.40
i.preco_extra = 0.40
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Swiss cheese"
i.categoria = "Queijos"
i.preco_normal = 0.40
i.preco_extra = 0.40
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Fried egg"
i.categoria = "Acompanhamentos"
i.preco_normal = 0.40
i.preco_extra = 0.40
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Corn"
i.categoria = "Acompanhamentos"
i.preco_normal = 0.50
i.preco_extra = 0.50
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Potato sticks"
i.categoria = "Acompanhamentos"
i.preco_normal = 0.40
i.preco_extra = 0.40
i.possiveis_quantidades = ["None", "One", "Double"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Lettuce"
i.categoria = "Salada"
i.preco_normal = 0.20
i.preco_extra = 0.20
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Tomato"
i.categoria = "Salada"
i.preco_normal = 0.20
i.preco_extra = 0.20
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Onion"
i.categoria = "Salada"
i.preco_normal = 0.30
i.preco_extra = 0.30
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Special mayonnaise"
i.categoria = "Molhos"
i.preco_normal = 1.00
i.preco_extra = 1.00
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Barbecue"
i.categoria = "Molhos"
i.preco_normal = 0.50
i.preco_extra = 0.50
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Olive oil"
i.categoria = "Molhos"
i.preco_normal = 0.20
i.preco_extra = 0.20
i.possiveis_quantidades = ["None", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

# Burgers
b = Burger.new
b.nome = "Demolisher"
b.ingredientes_base << "Ground beef (300g)"
b.ingredientes_base << "Mozzarella cheese"
b.ingredientes_base << "Fried egg"
b.ingredientes_base << "Corn"
b.ingredientes_base << "Potato sticks"
b.ingredientes_base << "Lettuce"
b.ingredientes_base << "Tomato"
b.ingredientes_base << "Special mayonnaise"
b.preco_base = 8.25
b.picture_url = "https://www.tasteofhome.com/wp-content/uploads/2017/10/exps28800_UG143377D12_18_1b_RMS-696x696.jpg"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "Steak from Heaven"
b.ingredientes_base << "Filet Steak (250g)"
b.ingredientes_base << "Cheddar cheese"
b.ingredientes_base << "Bacon"
b.ingredientes_base << "Barbecue"
b.preco_base = 9.75
b.picture_url = "https://www.chatelaine.com/wp-content/uploads/2017/05/Bibimbap-homemade-burgers.jpg"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "For Kids"
b.ingredientes_base << "Chicken breast (200g)"
b.ingredientes_base << "Mozzarella cheese"
b.ingredientes_base << "Lettuce"
b.ingredientes_base << "Tomato"
b.ingredientes_base << "Olive oil"
b.preco_base = 4.50
b.picture_url  = "https://3.bp.blogspot.com/-p5HEOBSbmw0/WdLj7o4iKSI/AAAAAAAAWzI/0rvGAVkSkGYK1uAVP-1pzYCXqnodv3o5gCLcBGAs/s320/Buffalo-Chicken-Burger-Square-3.JPG"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "Veggie"
b.ingredientes_base << "Swiss cheese"
b.ingredientes_base << "Fried egg"
b.ingredientes_base << "Lettuce"
b.ingredientes_base << "Tomato"
b.ingredientes_base << "Onion"
b.ingredientes_base << "Special mayonnaise"
b.ingredientes_base << "Olive oil"
b.preco_base = 6.25
b.picture_url  = "https://i.pinimg.com/originals/cd/57/94/cd57949435891dbd0d259f210bfff88e.jpg"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "Every-fucking-thing"
Ingrediente.all.each do |ingrediente|
  b.ingredientes_base << ingrediente.nome
end
b.preco_base = 13.00
b.picture_url  = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7kyG3I05kiPiZfRbIVumYfmnHdDsCfsC1KuwVgaWuxVBJkjeh3g"
b.save
p "Criado burger #{b.nome}"

# Bebidas
b = Bebida.new
b.nome = "Coke (350ml)"
b.categoria = "Soft"
b.preco_base = 0.75
b.picture_url = "https://images.freshop.com/1564405684703234156/189bf55411aae826bd30fc25a959fd13_medium.png"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Coke (600ml)"
b.categoria = "Soft"
b.preco_base = 1.25
b.picture_url = "https://coopsp.vteximg.com.br/arquivos/ids/156541-604-604/7894900011609_Refrigerante-Coca-Cola---600ml.jpg?v=636135130273000000"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Guarana Antartica (350ml)"
b.categoria = "Soft"
b.preco_base = 1.00
b.picture_url =  "https://decisaoentrega.fbitsstatic.net/img/p/refrigerante-guarana-antarctica-lata-350ml-261166/428032-3.jpg?w=420&h=420&v=no-change"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Water (500ml)"
b.categoria = "Soft"
b.preco_base = 1.00
b.picture_url = "https://imagens.gimba.com.br/objetosmidia/ExibirObjetoMidia?Id=56446"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Mate Couro (2L)"
b.categoria = "Soft"
b.preco_base = 2.00
b.picture_url = "https://decisaoentrega.fbitsstatic.net/img/p/refrigerante-mate-couro-tradicional-2l-263741/430607-2.jpg?w=420&h=420&v=no-change"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Guarana Jesus (350ml)"
b.categoria = "Soft"
b.preco_base = 1.00
b.picture_url = "https://d3o3bdzeq5san1.cloudfront.net/11/10676.jpg"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Guarana Dolly (2L)"
b.categoria = "Soft"
b.preco_base = 2.50
b.picture_url = "https://nagumonew.vteximg.com.br/arquivos/ids/175320-1000-1000/REFRIGERANTE-DE-GUARANA-DOLLY-2-LITROS-616348_1.jpg?v=636775499948430000"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Budweiser"
b.categoria = "Soft"
b.preco_base = 2.40
b.picture_url = "https://www.myamericanmarket.com/587-large_default/budweiser-beer-bottle.jpg"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Heineken"
b.categoria = "Soft"
b.preco_base = 2.40
b.picture_url = "https://cervejastore.vteximg.com.br/arquivos/ids/155927-1000-1000/heineken.jpg?v=636166141076670000"
b.save
p "Criado bebida #{b.nome}"






