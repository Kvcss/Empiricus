import 'package:empiricus_app/repositories/entities/list_entity.dart';
import 'package:flutter/material.dart';


class DetailView extends StatelessWidget {
  final Groups group;

  DetailView({required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          group.name ?? 'Detalhes',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  group.imageLarge ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      height: 200,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.grey, size: 100),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              group.name ?? 'Sem título',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              group.description ?? 'Sem descrição',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            if (group.authors != null && group.authors!.isNotEmpty) ...[
              const Text(
                'Autores:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...group.authors!.map(
                (author) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 20, // Reduz o tamanho do ícone
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft, 
                    child: Text(
                      author.name ?? 'Sem nome',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  subtitle: Text(
                    author.description ?? 'Sem descrição',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            if (group.features != null && group.features!.isNotEmpty) ...[
              const Text(
                'Características:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...group.features!.map(
                (feature) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.check_circle, color: Colors.black),
                  title: Text(
                    feature.title ?? 'Sem título',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    feature.description ?? 'Sem descrição',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
