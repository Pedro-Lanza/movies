import 'package:flutter/material.dart';
import 'package:movies/app/data/models/movie.dart';
import 'package:intl/intl.dart';

class DetailsInfo extends StatelessWidget {
  final Movie movie;
  const DetailsInfo({
    super.key,
    required this.movie,
  });

  List<Card> categories() {
    List<Card> categories = <Card>[];
    for (String categoria in movie.categorias) {
      categories.add(Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            categoria.toUpperCase(),
            style: const TextStyle(
                color: Color.fromRGBO(94, 103, 112, 1),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ));
    }
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat("#,##0.00", "en_US");
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: movie.media.toStringAsFixed(1), //"10.0",
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 56, 76, 1),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600)),
              const TextSpan(
                  text: "/10",
                  style: TextStyle(
                      color: Color.fromRGBO(134, 142, 150, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
      Text(
        movie.titulo, //"SimzArt",
        style: const TextStyle(
            color: Color.fromRGBO(52, 58, 64, 1),
            fontWeight: FontWeight.w600,
            fontSize: 14.0),
      ),
      RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.blue),
          children: [
            const TextSpan(
                text: "Título original: ",
                style: TextStyle(
                    color: Color.fromRGBO(94, 103, 112, 1),
                    fontSize: 10,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: movie.tituloOriginal, //"SimzArt",
                style: const TextStyle(
                    color: Color.fromRGBO(94, 103, 112, 1),
                    fontSize: 10,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
      const SizedBox(height: 30.0),
      Wrap(alignment: WrapAlignment.center, children: [
        Card(
          elevation: 1,
          color: const Color.fromRGBO(241, 243, 245, 1),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: "Ano: ",
                      style: TextStyle(
                          color: Color.fromRGBO(134, 142, 150, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: movie.estreia.substring(0, 4), //"2023",
                      style: const TextStyle(
                          color: Color.fromRGBO(52, 58, 64, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 1,
          color: const Color.fromRGBO(241, 243, 245, 1),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: "Duração: ",
                      style: TextStyle(
                          color: Color.fromRGBO(134, 142, 150, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text:
                          '${movie.duracao ~/ 60}h ${movie.duracao % 60}min', //"2 horas",
                      style: const TextStyle(
                          color: Color.fromRGBO(52, 58, 64, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        )
      ]),
      Wrap(alignment: WrapAlignment.center, children: categories()),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 90.0, bottom: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Descrição",
              style: TextStyle(
                color: Color.fromRGBO(94, 103, 112, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              movie.descricao,
              style: const TextStyle(
                color: Color.fromRGBO(52, 58, 64, 1),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1,
              color: Color.fromRGBO(241, 243, 245, 1),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "orçamento: ".toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromRGBO(134, 142, 150, 11),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "\$${currency.format(movie.orcamento)}",
                      style: const TextStyle(
                        color: Color.fromRGBO(52, 58, 64, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Card(
              elevation: 1,
              color: Color.fromRGBO(241, 243, 245, 1),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "produtoras: ".toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromRGBO(134, 142, 150, 11),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: movie.produtoras.join(", "),
                    style: const TextStyle(
                      color: Color.fromRGBO(52, 58, 64, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ])),
              ),
            ),
          )
        ]),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Diretor",
                style: TextStyle(
                  color: Color.fromRGBO(94, 103, 112, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                movie.diretor,
                style: const TextStyle(
                  color: Color.fromRGBO(52, 58, 64, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 30.0, bottom: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Elenco",
                style: TextStyle(
                  color: Color.fromRGBO(94, 103, 112, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                movie.elenco.join(", "),
                style: const TextStyle(
                  color: Color.fromRGBO(52, 58, 64, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
