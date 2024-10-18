class Persona{
    const provincia

    method puedeSerAtendidoPor(unProfesional){
        return unProfesional.provinciasDondeTrabaja().contains(provincia)
    }
}

class Institucion{
    const universidadesRec

    method puedeSerAtendidoPor(unProfesional){
        return universidadesRec.contains(unProfesional.universidad())
    }
}

class Club {
    const provinciasDondeEsta

    method puedeSerAtendidoPor(unProfesional){
        return not provinciasDondeEsta.asSet().intersection(unProfesional.provinciasDondeTrabaja().asSet()).isEmpty() 
    }
}