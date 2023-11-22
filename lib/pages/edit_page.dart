import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({required this.nameController, super.key});

  final TextEditingController nameController;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Editar Perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: widget.nameController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.nameController.text == '') {
                showDialog(
                  context: context,
                  builder: (_) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              'O nome é obrigatório',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
                return;
              }

              Navigator.of(context).pop();

              setState(() {
                widget.nameController.text;
              });
            },
            child: Text('Concluir'),
          ),
        ],
      ),
    );
  }
}
