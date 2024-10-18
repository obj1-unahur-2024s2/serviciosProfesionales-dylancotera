import universidades.*
class ProfesionalesVinculados{
    const property universidad 
    method honorarios() = universidad.honorariosRecomendados()
    method provinciasDondeTrabaja() = [universidad.provincia()]
    method cobrar(importe) { universidad.recibirDonacion(importe * 0.5) }
}

class ProfesionalesAsociados{
    const property universidad
    method honorarios() = 3000
    method provinciasDondeTrabaja() = ["Entre Rios", "Santa Fe","Corrientes"]
    method cobrar(importe) { asociacionDeProfesionalesDelLitoral.recibirDinero(importe) }   
}


class ProfesionalesLibres{
    const property universidad
    const property honorarios
    const property provinciasDondeTrabaja
    var totalRecaudado = 0

    method agregarProvincia(unaProvincia) {provinciasDondeTrabaja.add(unaProvincia)}

    method cobrar(importe) { totalRecaudado = totalRecaudado + importe }

    method pasarDinero(profesional, importe){
        totalRecaudado = (totalRecaudado - importe).max(0)
        profesional.cobrar(importe)
    }
}


object asociacionDeProfesionalesDelLitoral {
    var totalRecaudado = 0

    method recibirDinero(importe){ totalRecaudado = totalRecaudado + importe }
    method totalRecaudado() = totalRecaudado
}