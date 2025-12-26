import 'package:flutter/material.dart';
import 'package:mini_ecommerce/data/category_data.dart';


class Category extends StatelessWidget {
  /// Constructeur const pour de meilleures performances
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox permet de fixer la hauteur du ListView horizontal
    // Sans contrainte de hauteur, Flutter générerait une erreur de layout
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // Scroll horizontal (classique pour les catégories e-commerce)
        itemCount: categories.length, // Nombre total de catégories à afficher
        separatorBuilder: (context, index) => const SizedBox(width: 20), // Espacement constant entre chaque item

        // Construction dynamique de chaque item
        itemBuilder: (context, index) {
          final category = categories[index]; // Récupération de la catégorie courante

          // Chaque catégorie est affichée verticalement :
          // image circulaire + titre
          return Column(
            children: [
              // Container circulaire pour l’image de la catégorie
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,  // Forme circulaire
                  // Image chargée depuis les assets
                  image: DecorationImage(
                    image: AssetImage(category.image),
                    fit: BoxFit.cover,  // L’image couvre tout le cercle sans déformation
                  ),
                ),
              ),
              const SizedBox(height: 6),  // Petit espace vertical entre l’image et le texte
              // Titre de la catégorie
              Text(
                category.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
