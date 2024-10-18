
class Empresa{
    const profesionales = []
    const property honorarioDeReferencia
    const property clientes = []

    method contratar(unProfesional){
        profesionales.add(unProfesional)
    }

    method cantidadProfesionalesQueEstudiaronEn(unaUniversidad){
        return profesionales.count({p=> p.universidad() == unaUniversidad})
    }

    method profesionalesCaros(){
        return profesionales.filter({ p => p.honorarios() > honorarioDeReferencia }).asSet()
    }

    method universidadesFormadoras(){
        return profesionales.map({p => p.universidad()}).asSet()
    }

    method profesionalMasBarato(){
        return profesionales.min({p=>p.honorarios()})
    }

    method esDeGenteAcotada(){
        return profesionales.all({p=> p.provinciasDondeTrabaja().size() <= 3})
    }    

    method puedeSatifascer(solicitante){
        return profesionales.any({p => solicitante.puedeSerAtendidoPor(p)})
    }

    method darServicio(solicitante){
        if (self.puedeSatifascer(solicitante) ) {
            const unProf = profesionales.find({p=>solicitante.puedeSerAtendidoPor(p)})
            unProf.cobrar(unProf.honorarios())
            clientes.add(solicitante)
        } 
    }
    method cantidadDeClientes() = clientes.size()
    
    method tieneComoClienteA(cliente) = clientes.contains(cliente)

    method esProfesionalPocoAtractivo(unProfesional) {
        const provinciasProf = unProfesional.provinciasDondeTrabaja().asSet()
        const profMismasProv = profesionales.filter({p=>p.provinciasDondeTrabaja().asSet() == provinciasProf })
        return profMismasProv.any({p=>p.honorarios() < unProfesional.honorarios()})
    }
}

