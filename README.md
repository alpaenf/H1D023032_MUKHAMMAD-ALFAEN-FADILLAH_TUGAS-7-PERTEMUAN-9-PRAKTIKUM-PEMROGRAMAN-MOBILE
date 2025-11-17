# H1D023032_Tugas7 

Aplikasi Flutter modern dengan desain minimalis menggunakan warna dominan **putih** dan **biru**, serta font **Poppins**.

## ✨ Fitur

- **Login Page**: Halaman login modern dengan validasi username dan password
- **Dashboard**: Halaman dashboard dengan statistics cards dan recent activity
- **Profile**: Halaman profil user dengan informasi lengkap
- **Settings**: Halaman pengaturan dengan berbagai preferensi
- **Side Menu**: Drawer navigasi dengan tema sage green yang elegan
- **Local Storage**: Penyimpanan data login menggunakan SharedPreferences
- **Routing**: Navigasi terstruktur dengan named routes

## 📁 Struktur Proyek

```
lib/
├── constants/
│   └── app_theme.dart          # Theme configuration dengan warna biru
├── routes/
│   └── app_routes.dart         # Route definitions
├── services/
│   └── storage_service.dart    # SharedPreferences service
├── pages/
│   ├── login_page.dart         # Halaman login
│   ├── dashboard_page.dart     # Halaman dashboard
│   ├── profile_page.dart       # Halaman profile
│   └── settings_page.dart      # Halaman settings
├── widgets/
│   └── side_menu.dart          # Drawer/Side menu
└── main.dart                   # Entry point aplikasi
```

## 🚀 Cara Menjalankan

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run Application**
   ```bash
   flutter run
   ```

3. **Login**
   - Masukkan username (bebas)
   - Masukkan password minimal 6 karakter
   - Klik tombol Login

## 📦 Dependencies

- `flutter`: Framework utama
- `shared_preferences: ^2.2.2`: Local storage
- `google_fonts: ^6.1.0`: Font Poppins
- `cupertino_icons: ^1.0.8`: iOS style icons

## 🎯 Fitur Login & Storage

- **Login**: Username dan password disimpan menggunakan SharedPreferences
- **Auto Login**: Aplikasi mengecek status login saat startup
- **Logout**: Data login dihapus dari local storage
- **Persistent**: Data tetap tersimpan setelah aplikasi ditutup

## 🎨 UI Highlights

### Login Page
- Desain minimalis dengan icon circular
- Input fields dengan biru theme
- Password visibility toggle
- Loading state saat login
- Info hint box

### Dashboard
- Welcome card dengan warna biru
- Quick stats grid (Tasks, Progress, Notifications, Points)
- Recent activity list dengan timestamps
- Smooth animations dan shadows

### Profile
- Profile header dengan gradient background
- Info cards dengan icons
- Edit profile button
- Clean layout dengan spacing yang baik

### Settings
- Toggle switches untuk notifications dan dark mode
- Font size slider dengan visual feedback
- Action buttons untuk account settings
- About dialog dengan app information

### Side Menu
- Gradient header dengan biru
- User avatar dan welcome message
- Icon-based navigation items
- Active state indicators
- Logout button di bagian bawah

## 🎨 Design Philosophy

Aplikasi ini menggunakan pendekatan **soft minimalism** dengan:
- **Clean backgrounds**: Dominasi warna putih untuk kesan bersih
- **Sage green accents**: Warna biru yang lembut untuk elemen interaktif
- **Proper spacing**: Padding dan margin yang konsisten
- **Rounded corners**: Border radius 12-20px untuk kesan modern
- **Subtle shadows**: Box shadow lembut untuk depth
- **Gradient elements**: Gradient biru untuk highlight areas
- **Icon consistency**: Icons dengan background colored containers

## 🔐 Keamanan

- Password input dengan obscure text
- Data disimpan di local storage (SharedPreferences)
- Logout menghapus semua data sensitif

## 🎓 Pembelajaran

Proyek ini mencakup:
- State management dengan StatefulWidget
- Navigation dengan named routes
- Local storage dengan SharedPreferences
- Custom theming dengan Google Fonts
- Widget composition dan reusability
- FutureBuilder untuk async operations
- Form validation
- Responsive layout

## 🔗 Link Demo
Asprak dapat melihat demo aplikasi dibawah ini  
<img src="https://github.com/alpaenf/H1D023032_MUKHAMMAD-ALFAEN-FADILLAH_TUGAS-7-PERTEMUAN-9-PRAKTIKUM-PEMROGRAMAN-MOBILE/blob/main/lib/Perekaman%20Layar%202025-11-17%20204007.gif" width="250">

---


