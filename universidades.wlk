class Universidad {
    const property provincia
    const property honorariosRecomendados
    var donaciones = 0
    
    method recibirDonacion(importe){ donaciones = donaciones + importe }
    
    method donaciones() = donaciones
}