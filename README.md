# SnapOCR - Extraction de Texte Locale

Extraire du texte depuis vos images, localement et gratuitement, sans envoyer vos données en ligne.

## Fonctionnalités

✅ **Extraction OCR locale** avec Tesseract.js  
✅ **Zéro upload** - Tout se passe dans votre navigateur  
✅ **Multi-langues** - Français, Anglais, Espagnol, Allemand, Italien, Portugais, Arabe, Chinois  
✅ **Photo depuis la webcam** - Prenez une photo directement  
✅ **Drag & Drop** - Glissez-déposez vos images  
✅ **Édition du texte** - Modifiez le résultat si besoin  
✅ **Export TXT** - Téléchargez le texte extrait  
✅ **Statistiques** - Nombre de caractères, mots, confiance  
✅ **Design minimaliste** - Interface noir et blanc épurée  
✅ **PWA ready** - Installable comme une app  
✅ **100% gratuit** - Aucun compte, aucune limite

## Démarrage Rapide

### Option 1 : Serveur local (Recommandé)

**Linux/Mac :**
```bash
# Clonez le repo
git clone https://github.com/votre-username/snapocr.git
cd snapocr

# Rendez le script exécutable
chmod +x start.sh

# Lancez le serveur
./start.sh

# Ouvrez http://localhost:8000
```

**Windows :**
```bash
# Clonez le repo
git clone https://github.com/votre-username/snapocr.git
cd snapocr

# Lancez le serveur
start.bat

# Ouvrez http://localhost:8000
```

**Méthode manuelle (tous OS) :**
```bash
cd snapocr
python3 -m http.server 8000
# Puis ouvrez http://localhost:8000
```

### Option 2 : Fichier local (peut avoir des limitations)

 **Attention** : Ouvrir `index.html` directement (double-clic) peut causer des erreurs CORS. 
Utilisez plutôt un serveur local (Option 1).

Si vous voulez quand même essayer :
1. Téléchargez `index.html`
2. Double-cliquez dessus
3. Si vous voyez une erreur CORS, utilisez l'Option 1

##  Utilisation

### 1. Charger une image

**Méthode A : Upload**
- Cliquez sur la zone de upload
- Sélectionnez une image (JPG, PNG, WebP, PDF)
- Ou glissez-déposez directement

**Méthode B : Webcam**
- Cliquez sur "Prendre une photo"
- Autorisez l'accès à la caméra
- Cliquez sur "Capturer"

### 2. Sélectionner la langue

Choisissez la langue du texte dans l'image :
- 🇫🇷 Français
- 🇬🇧 English
- 🇪🇸 Español
- 🇩🇪 Deutsch
- 🇮🇹 Italiano
- 🇵🇹 Português
- 🇸🇦 العربية
- 🇨🇳 中文

### 3. Extraire le texte

- Cliquez sur "Extraire le texte"
- Patientez pendant l'analyse (5-30 secondes selon l'image)
- Le texte apparaît dans le panneau de droite

### 4. Utiliser le résultat

- **Éditer** : Cliquez sur le texte pour le modifier
- **Copier** : Copiez dans le presse-papier
- **Télécharger** : Exportez en fichier TXT
- **Effacer** : Nettoyez le résultat

##  Architecture

```
SnapOCR/
├── index.html          # Application complète (HTML/CSS/JS)
├── manifest.json       # Configuration PWA
├── README.md          # Documentation
└── LICENSE            # Licence MIT
```

### Technologies

**Frontend :**
- HTML5 + CSS3
- Vanilla JavaScript (ES6+)
- Tesseract.js (OCR)
- Media Devices API (webcam)
- File API (upload)

**Pas de backend :** 100% client-side !

##  Cas d'Usage

### Étudiants
- Scanner des notes de cours
- Numériser des livres
- Extraire du texte de captures d'écran

### Professionnels
- Digitaliser des documents papier
- Extraire du texte de factures/tickets
- Convertir des PDF image en texte

### Développeurs
- Extraire du code depuis des screenshots
- Digitaliser des schémas techniques
- Récupérer du texte depuis des mockups

### Voyageurs
- Traduire des panneaux/menus (extraction + traduction)
- Numériser des documents administratifs
- Sauvegarder du texte de brochures

##  Fonctionnement Technique

### Tesseract.js

SnapOCR utilise [Tesseract.js](https://tesseract.projectnaptha.com/), un port JavaScript de Tesseract OCR.

**Avantages :**
- Fonctionne 100% dans le navigateur
- Aucune donnée envoyée sur un serveur
- Gratuit et open source
- Supporte 100+ langues

**Performance :**
- Petites images (< 1MB) : 5-10 secondes
- Moyennes images (1-3MB) : 10-20 secondes
- Grandes images (> 3MB) : 20-40 secondes

### Langues Supportées

Les modèles de langues sont téléchargés automatiquement depuis le CDN de Tesseract lors du premier usage.

Taille des modèles :
- Français (fra) : ~10MB
- Anglais (eng) : ~8MB
- Autres : 8-15MB chacune

Les modèles sont mis en cache par le navigateur.

##  Personnalisation

### Changer les couleurs

Dans `index.html`, modifiez les variables CSS :

```css
/* Couleur principale */
background: #000000;  /* Noir */
color: #FFFFFF;       /* Blanc */

/* Accent */
border: 3px solid #000000;
```

### Ajouter des langues

```javascript
<option value="jpn">🇯🇵 日本語</option>
<option value="kor">🇰🇷 한국어</option>
<option value="rus">🇷🇺 Русский</option>
```

Liste complète : https://tesseract-ocr.github.io/tessdoc/Data-Files

### Améliorer la précision

Pour de meilleurs résultats :
- Utilisez des images nettes et bien éclairées
- Évitez les photos floues ou pixelisées
- Préférez un fond contrasté (texte noir sur fond blanc)
- Redressez les images inclinées
- Augmentez la résolution si possible

## Dépannage

### Erreur "Permission non accordée" (Linux/Mac)
```bash
chmod +x start.sh
./start.sh
```

### Erreur CORS "blocked by CORS policy"
**Cause** : Vous avez ouvert `index.html` directement (file://) au lieu d'utiliser un serveur HTTP.

**Solution** :
```bash
# Lancez un serveur local
python3 -m http.server 8000
# Puis ouvrez http://localhost:8000 (pas file://...)
```

### L'extraction est lente
- Normal pour de grandes images
- Réduisez la taille de l'image (max 2000x2000px recommandé)
- Utilisez un navigateur récent (Chrome, Firefox, Edge)

### Le texte n'est pas détecté
- Vérifiez que la langue sélectionnée est correcte
- Assurez-vous que l'image est nette
- Augmentez le contraste de l'image
- Essayez avec une meilleure résolution

### La caméra ne fonctionne pas
- Autorisez l'accès à la caméra dans le navigateur
- Utilisez HTTPS ou localhost uniquement
- Vérifiez que la caméra n'est pas utilisée par une autre app

### Erreur "Impossible de charger le modèle"
- Vérifiez votre connexion internet (nécessaire pour le premier chargement)
- Videz le cache du navigateur
- Réessayez après quelques minutes

##  Amélioration de la Précision

### Prétraitement d'image

Pour de meilleurs résultats, vous pouvez prétraiter vos images :

**Outils recommandés :**
- GIMP : Augmenter le contraste, redresser
- IrfanView : Rotation, recadrage
- ImageMagick : Automatisation en ligne de commande

**Techniques :**
- Convertir en noir et blanc
- Augmenter le contraste (niveaux)
- Redresser les images inclinées
- Supprimer le bruit (déspeckling)

##  Comparaison avec les Alternatives

| Outil | Local | Gratuit | Langues | Limite |
|-------|-------|---------|---------|--------|
| **SnapOCR** | ✅ | ✅ | 8+ | Aucune |
| Google Lens | ❌ | ✅ | 100+ | Quotas |
| Adobe Acrobat | ❌ | ❌ | Limité | Abonnement |
| Online OCR | ❌ | ⚠️ | Limité | 15 pages/h |

##  Confidentialité

**SnapOCR respecte votre vie privée :**

✅ **Aucune donnée envoyée** - Tout se passe localement  
✅ **Pas de tracking** - Aucun analytics, cookies, ou pixels  
✅ **Pas de compte** - Aucune inscription requise  
✅ **Open source** - Code auditable par tous  
✅ **Pas de stockage cloud** - Vos images restent chez vous  

##  Contribution

Les contributions sont les bienvenues !

**Comment contribuer :**

1. Fork le projet
2. Créez une branche (`git checkout -b feature/amelioration`)
3. Commit vos changements (`git commit -m 'Ajout de X'`)
4. Push (`git push origin feature/amelioration`)
5. Ouvrez une Pull Request

**Idées de contributions :**
- Support de nouvelles langues
- Amélioration de l'UI/UX
- Prétraitement d'image automatique
- Export en formats additionnels (DOCX, PDF)
- Mode batch (traiter plusieurs images)

---

**Fait pour la vie privée et l'open source**