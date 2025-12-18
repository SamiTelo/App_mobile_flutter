# Mini App E-Commerce Flutter

[![Flutter](https://img.shields.io/badge/Flutter-2.20-blue?logo=flutter)](https://flutter.dev/)

## Description
Mini App E-Commerce est une application mobile développée avec **Flutter** permettant de parcourir des produits, les ajouter au panier, gérer les favoris et passer des commandes. Cette application est conçue comme un **prototype léger** d’une boutique en ligne.


## Objectif

L’objectif de ce projet est de développer une **application mobile e-commerce complète** en Flutter, permettant de gérer :

- La liste de produits
- Le panier des utilisateurs
- Les produits favoris

Ce projet, bien qu’étant une initiative personnelle, est rendu public pour :

- **Partager une architecture propre et réutilisable**, adaptée aux projets Flutter modulaires.
- **Servir de référence ou d’inspiration** à d’autres développeurs souhaitant créer une application e-commerce.

## status : En cours de developpement

---

## Fonctionnalités principales

- Affichage des produits avec images, prix et descriptions
- Recherche et filtrage des produits
- Gestion du panier (ajout, suppression, quantité)
- Gestion des favoris
- Navigation fluide entre les écrans (Home, Détail produit, Panier, Favoris)
- Compatible Android et iOS

---

## Installation

1. Cloner le repository :
```bash
git clone https://github.com/SamiTelo/App_mobile_flutter.git
cd App_mobile_flutter
Installer les dépendances Flutter :

bash
Copier le code
flutter pub get
Lancer l’application sur un émulateur ou appareil connecté :

bash
Copier le code
flutter run
Structure du projet
bash
Copier le code
lib/
├── constants.dart       # Contient toutes les constantes globales de l'application (couleurs, styles, padding, etc.)
├── navbar_screen.dart   # Gère la logique et l'affichage du BottomNavigationBar principal
├── main.dart            # Point d'entrée de l'application Flutter, initialise l'app et le routing
├── screens/             # Dossier contenant tous les écrans de l'application
│   ├── home/            # Écran d'accueil et ses composants spécifiques
│   ├── cart/            # Écran du panier et gestion des items ajoutés
│   ├── profile/         # Écran de profile utilisateur
│   ├── detail/          # Écran de détail produit
│   └── favoris/         # Écran des produits favoris
├── widgets/             # Dossier des widgets réutilisables dans toute l'application
│   └── appbar/          # Composants spécifiques pour les AppBars personnalisées
└── models/              # Modèles de données (ex: Product, User, CartItem) utilisés dans l'application
assets/
├── images/
├── font/ 

Packages utilisés
flutter/material.dart

provider (pour la gestion d’état, si utilisé)

flutter_swiper_view (pour les sliders, si utilisé)

Autres packages spécifiques à ton projet

Contribuer
Fork le projet

Créer une branche pour vos modifications :

bash
Copier le code
git checkout -b feature/ma-fonctionnalité
Commit et push :

bash
Copier le code
git commit -m "Ajouter une fonctionnalité"
git push origin feature/ma-fonctionnalité
Créer une pull request

Licence
Ce projet est sous licence MIT.

Auteur
Sami Telo

Contact : [ton.email@example.com]

yaml
Copier le code

---

### Étapes pour l’ajouter et pousser sur GitHub

1. Crée le fichier `README.md` à la racine de ton projet et colle le contenu ci-dessus.  
2. Dans ton terminal :

```bash
git add README.md
git commit -m "Ajout du README"
git push origin main