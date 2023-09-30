import 'package:flutter/material.dart';

class EventList extends StatefulWidget {
  final String search;
  const EventList({super.key, required this.search});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Map<String, dynamic>> filterred = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> techEvents = [
    {
      'nome': 'Sinergia: Maputo Frontenders',
      'data': '30 de Setembro de 2023',
      'local': 'Maputo, Moçambique',
      'descricao': 'A soma de todo.',
    },
    {
      'nome': 'Web Summit',
      'data': '1-4 de Novembro de 2023',
      'local': 'Lisboa, Portugal',
      'descricao': 'Uma das maiores conferências de tecnologia do mundo.',
    },
    {
      'nome': 'Google I/O',
      'data': 'Maio de 2023',
      'local': 'Online',
      'descricao': 'A conferência anual do Google para desenvolvedores.',
    },
    {
      'nome': 'CES 2023',
      'data': '5-8 de Janeiro de 2023',
      'local': 'Las Vegas, EUA',
      'descricao': 'A maior feira de eletrônicos do mundo.',
    },
    {
      'nome': 'AWS re:Invent',
      'data': 'Dezembro de 2023',
      'local': 'Las Vegas, EUA',
      'descricao': 'Conferência anual da Amazon Web Services.',
    },
  ];

  List<Map<String, dynamic>> filter() {
    return techEvents
        .where((evento) =>
            evento['nome'].toLowerCase().contains(widget.search.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    filterred = filter();
  }

  @override
  void didUpdateWidget(EventList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.search != widget.search) { 
      debugPrint("Render EventList Builder");
      filterred = filter();
    }
  }

  @override
  Widget build(BuildContext context) {

    /*Não chamamos a função no build() para não decrementar a performance, porque 
    o build seria chamado sempre que executassemos um filtro, dai a necessidade 
    de reescrever o didUpdateWidget */

    // print("Render EventList Builder");
    //filterred = filter();
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filterred[index]['nome']),
            subtitle: Text(filterred[index]['data']),
            leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Text(filterred[index]['nome'].substring(0, 1),
                    style: const TextStyle(fontWeight: FontWeight.bold))),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: filterred.length);
  }
}
