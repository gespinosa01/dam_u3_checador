import 'package:dam_u3_practica1_checador/controlador/DBHorario.dart';
import 'package:dam_u3_practica1_checador/controlador/DBMateria.dart';
import 'package:dam_u3_practica1_checador/controlador/DBProfesor.dart';
import 'package:dam_u3_practica1_checador/modelo/horario.dart';
import 'package:dam_u3_practica1_checador/modelo/materia.dart';
import 'package:dam_u3_practica1_checador/modelo/profesor.dart';
import 'package:dam_u3_practica1_checador/vista/horarios/registrarHorarios.dart';
import 'package:flutter/material.dart';

class Horarios extends StatefulWidget {
  const Horarios({super.key});

  @override
  State<Horarios> createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  List<Horario> horarios = [];

  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarlista();
  }

  void cargarlista() async {
    List<Horario> l = await DBHorario.mostrar();
    setState(() {
      horarios = l;
    });
  }


  Widget build(BuildContext context) {
    cargarlista();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Horarios'),
        backgroundColor: Colors.grey.shade500,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarHorarios()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: horarios.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(horarios[index].nprofesor),
              leading: CircleAvatar(child: Text("${horarios[index].nhorario}"),),
              subtitle: Text(horarios[index].nmat),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Acción para actualizar el horario
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el horario
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
