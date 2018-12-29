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
i.nome = "Carne bovina 200g"
i.categoria = "Carnes"
i.preco_normal = 2.00
i.preco_extra = 1.50
i.possiveis_quantidades = ["Sem", "Uma", "Dobro"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Carne de picanha 200g"
i.categoria = "Carnes"
i.preco_normal = 4.00
i.preco_extra = 3.50
i.possiveis_quantidades = ["Sem", "Uma", "Dobro"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Bacon"
i.categoria = "Carnes"
i.preco_normal = 2.50
i.preco_extra = 2.50
i.possiveis_quantidades = ["Sem", "Normal", "Dobro"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Carne de frango 200g"
i.categoria = "Carnes"
i.preco_normal = 1.50
i.preco_extra = 1.50
i.possiveis_quantidades = ["Sem", "Uma", "Dobro"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Queijo prato"
i.categoria = "Queijos"
i.preco_normal = 1.00
i.preco_extra = 1.00
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Queijo cheddar"
i.categoria = "Queijos"
i.preco_normal = 1.50
i.preco_extra = 1.50
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Alface"
i.categoria = "Salada"
i.preco_normal = 0.50
i.preco_extra = 0.50
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Tomate"
i.categoria = "Salada"
i.preco_normal = 0.50
i.preco_extra = 0.50
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Maionese especial"
i.categoria = "Molhos"
i.preco_normal = 1.50
i.preco_extra = 1.50
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

i = Ingrediente.new
i.nome = "Barbecue"
i.categoria = "Molhos"
i.preco_normal = 1.00
i.preco_extra = 1.00
i.possiveis_quantidades = ["Sem", "Normal", "Extra"]
i.save
p "Criado ingrediente #{i.nome}"

# Burgers
b = Burger.new
b.nome = "Cabulosasso"
b.ingredientes_base << "Carne bovina 200g"
b.ingredientes_base << "Queijo cheddar"
b.ingredientes_base << "Alface"
b.ingredientes_base << "Tomate"
b.ingredientes_base << "Maionese especial"
b.preco_base = 12.00
b.picture_url = "https://www.tasteofhome.com/wp-content/uploads/2017/10/exps28800_UG143377D12_18_1b_RMS-696x696.jpg"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "Picanheta"
b.ingredientes_base << "Carne de picanha 200g"
b.ingredientes_base << "Queijo prato"
b.ingredientes_base << "Bacon"
b.ingredientes_base << "Barbecue"
b.preco_base = 13.50
b.picture_url = "https://www.chatelaine.com/wp-content/uploads/2017/05/Bibimbap-homemade-burgers.jpg"
b.save
p "Criado burger #{b.nome}"

b = Burger.new
b.nome = "De boa"
b.ingredientes_base << "Carne de frango 200g"
b.ingredientes_base << "Queijo prato"
b.ingredientes_base << "Alface"
b.ingredientes_base << "Tomate"
b.preco_base = 9.75
b.picture_url  = "https://3.bp.blogspot.com/-p5HEOBSbmw0/WdLj7o4iKSI/AAAAAAAAWzI/0rvGAVkSkGYK1uAVP-1pzYCXqnodv3o5gCLcBGAs/s320/Buffalo-Chicken-Burger-Square-3.JPG"
b.save
p "Criado burger #{b.nome}"

# Bebidas
b = Bebida.new
b.nome = "Coca-cola lata"
b.categoria = "Soft"
b.preco_base = 3.50
b.picture_url = "https://images.freshop.com/1564405684703234156/189bf55411aae826bd30fc25a959fd13_medium.png"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Coca-cola 600ml"
b.categoria = "Soft"
b.preco_base = 5.00
b.picture_url = "https://coopsp.vteximg.com.br/arquivos/ids/156541-604-604/7894900011609_Refrigerante-Coca-Cola---600ml.jpg?v=636135130273000000"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Guarana Antartica lata"
b.categoria = "Soft"
b.preco_base = 3.50
b.picture_url =  "https://decisaoentrega.fbitsstatic.net/img/p/refrigerante-guarana-antarctica-lata-350ml-261166/428032-3.jpg?w=420&h=420&v=no-change"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Agua mineral 600ml"
b.categoria = "Soft"
b.preco_base = 2.50
b.picture_url = "https://imagens.gimba.com.br/objetosmidia/ExibirObjetoMidia?Id=56446"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Budweiser long-neck"
b.categoria = "Soft"
b.preco_base = 6.99
b.picture_url = "https://www.myamericanmarket.com/587-large_default/budweiser-beer-bottle.jpg"
b.save
p "Criado bebida #{b.nome}"

b = Bebida.new
b.nome = "Heineken long-neck"
b.categoria = "Soft"
b.preco_base = 6.99
b.picture_url = "https://cervejastore.vteximg.com.br/arquivos/ids/155927-1000-1000/heineken.jpg?v=636166141076670000"
b.save
p "Criado bebida #{b.nome}"





