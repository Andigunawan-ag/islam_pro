import 'package:Islam_Pro/main.dart';
import 'package:flutter/material.dart';

// Halaman utama Bacaan Salat
class BacaanSalatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Sholat Dan Doa Doa'),
        leading: IconButton(
          icon: Icon(Icons.home), // Ganti ikon menjadi ikon home
          onPressed: () {
            // Fungsi kembali (pop dari stack navigasi)
            Navigator.pop(context);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Bacaan Sholat Dan doa doa'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildCard(context, 'Bacaan dan Niat Salat 5 waktu',BacaanSholat5WaktuPage()),
          buildCard(context, 'Bacaan sholat ', Bacaanshalat()),
          buildCard(context, 'Bacaan doa Sehabis Sholat', Bacaandoasehabissholat()),
          buildCard(context, 'Bacaan doa doa pilihan', Bacaandoadoapilihan()),
          buildCard(context, 'Bacaan doa selamat', Bacaandoatahlil()),
        ],
      ),
    );
  }

  // Fungsi untuk membuat card bacaan salat
  Widget buildCard(BuildContext context, String title, Widget page) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.menu_book,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
      ),
    );
  }
}

// Halaman Home
class BacaanSholat5WaktuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan dan Niat Sholat 5 Waktu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Niat Salat Subuh
              _buildSection(
                'Niat Salat Subuh',
                'اُصَلّى فَرْضَ الصُّبْحِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ آدَاءً مَأْمُوْمً / إِمَامًا لِلَّهِ تَعَالَى',
                'Aku niat sholat fardhu subuh dua rakaat menghadap kiblat, menjadi makmum/imam karena Allah Ta’ala',
              ),
              SizedBox(height: 20),
              // Niat Salat Dzuhur
              _buildSection(
                'Niat Salat Dzuhur',
                'اُصَلّى فَرْضَ الظُّهْرِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ آدَاءً مَأْمُوْمً / إِمَامًا لِلَّهِ تَعَالَى',
                'Aku niat sholat fardhu dzuhur empat rakaat menghadap kiblat, menjadi makmum/imam karena Allah Ta’ala',
              ),
              SizedBox(height: 20),
              // Niat Salat Asar
              _buildSection(
                'Niat Salat Asar',
                'اُصَلّى فَرْضَ الْعَصْرِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ آدَاءً مَأْمُوْمً / إِمَامًا لِلَّهِ تَعَالَى',
                'Aku niat sholat fardhu asar dua rakaat menghadap kiblat, menjadi makmum/imam karena Allah Ta’ala',
              ),
              SizedBox(height: 20),
              // Niat Salat Maghrib
              _buildSection(
                'Niat Salat Maghrib',
                'اُصَلّى فَرْضَ الْمَغْرِبِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ آدَاءً مَأْمُوْمً / إِمَامًا لِلَّهِ تَعَالَى',
                'Aku niat sholat fardhu maghrib tiga rakaat menghadap kiblat, menjadi makmum/imam karena Allah Ta’ala',
              ),
              SizedBox(height: 20),
              // Niat Salat Isya
              _buildSection(
                'Niat Salat Isya',
                'اُصَلّى فَرْضَ الْعِشَاءِ رَكْعَتَيْنِ مُسْتَقْبِلَ الْقِبْلَةِ آدَاءً مَأْمُوْمً / إِمَامًا لِلَّهِ تَعَالَى',
                'Aku niat sholat fardhu isya empat rakaat menghadap kiblat, menjadi makmum/imam karena Allah Ta’ala',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan setiap bagian (niat) dengan judul dan isi
  Widget _buildSection(String title, String content, String artiContent) {
    return Container(
      width: double.infinity, // Ensures the container spans the entire width
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 2),  // Border for each section
        borderRadius: BorderRadius.circular(10),  // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Artinya: $artiContent',
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// Halaman Bacaan sholat
class Bacaanshalat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Sholat'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bacaan Salat Dzuhur
            Text(
              'Bacaan Salat Dzuhur',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSection(
                'Doa Iftitah (Doa Pembukaan Shalat)',
                'اللَّهُ أَكْبَرُ كَبِيرًا وَالْحَمْدُ لِلَّهِ كَثِيرًا وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلًا\n'
                    'إِنِّي وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا مُسْلِمًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ\n'
                    'إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ\n'
                    'لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ',
                'Allahu Akbaru Kabiran, walhamdu lillahi katsiran, wa subhanallahi bukratan wa asilan\n'
                    'Inni wajjahtu wajhiya lilladhi fatara as-samawati wal-ardh hanifan muslima, wa ma ana minal mushrikun\n'
                    'Inna salati wa nusuki wa mahyaya wa mamati lillahi rabbil ‘alamin\n'
                    'La sharika lahu wabidhalika umirtu wa ana minal muslimeen',
                'Allah Maha Besar, segala puji bagi Allah, Maha Suci Allah di pagi dan petang. Sesungguhnya, aku menghadap wajahku kepada Tuhan yang menciptakan langit dan bumi, dengan penuh ketundukan, dan aku bukan termasuk orang-orang yang musyrik. Sesungguhnya, sholatku, ibadahku, hidupku, dan matiku hanya untuk Allah, Tuhan semesta alam. Tidak ada sekutu bagi-Nya, dan dengan itu aku diperintah, dan aku adalah salah satu orang Muslim.'
            ),
            _buildSection(
                'Ruku\' (Bungkukkan badan setelah membaca Surah Pendek)',
                'سُبْحَانَ رَبِّىَ الْعَظِيْمِ وَبِحَمْدِهِ',
                'Subhana rabbiyal azim wa bihamdih (3x)',
                'Mahasuci Tuhanku yang Maha Agung dan maha terpuji.'),
            _buildSection(
                'Iqtidal (Berdiri Tegak setelah Ruku)',
                'Sami\' Allahu liman hamidah',
                'رَبَّنَا لَكَ الْحَمْدُ مِلْءَ السَّمَوَاتِ وَمِلْءَ الْأَرْضِ وَمِلْءَ مَا شِئْتَ مِنْ شَيْءٍ بَعْدُ',
                'Rabbanaaa lakal hamdu mil ussamaawaati wa mil ul ardhi wa mil-u maa syik ta min syai im ba du'
                    'Artinya: "Ya Allah Tuhan Kami, Bagi-Mu lah segala puji, sepenuh langit dan bumi, dan sepenuh barang yang Kau kehendaki sesudah itu.'),

            _buildSection(
                'Sujud (Sujud pertama setelah Iktidal)',
                'سُبْحَانَ رَبِّىَ الأَعْلَى وَبِحَمْدِهِٰ',
                'Subhana rabbiyal a\'la wa bihamdih',
                'Mahasuci Tuhanku Yang Maha Tinggi dan pujian untuk Nya'),
            _buildSection(
                'Duduk di Antara Dua Sujud',
                'رَبِّ اغْفِرْلِىْ وَارْحَمْنِىْ وَاجْبُرْنِىْ وَارْفَعْنِىْ وَازُقْنِىْ وَاهْدِنِىٌ وَعَا فِنِىْ وَاعْفُ عَنِّىْ',
                'Rabbighfir li warhamni wajburni warfa\'ni warzuqni wahdini wa\'afini wa\'fu anni',
                'Tuhanku, ampunilah aku, rahmatilah aku, cukupkanlah keperluanku, dan angkatlah derajatku.'),
            _buildSection(
                'Sujud Kedua',
                'سُبْحَانَ رَبِّىَ الأَعْلَى وَبِحَمْدِهِٰ',
                'Subhana rabbiyal a\'la wa bihamdih',
                'Mahasuci Tuhanku Yang Maha Tinggi dan pujian untuk Nya'),

            _buildSection(
                'Tasyahhud Akhir',
                'التَّحِيَّاتُ الْمُبَارَكَاتُ الصَّلَوَاتُ الطَّيِّبَاتُ لِلَّهِ السَّلاَمُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ السَّلاَمُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّ اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى سَيِّدِ نَا إِبْرَاهِيمَ وَعَلَى آلِ سَيِّدِ نَا إِبْرَاهِيمَ وَبَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ سَيِّدِ نَا مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى سَيِّدِ نَا إِبْرَاهِيمَ وَعَلَى آلِ سَيِّدِ نَا إِبْرَاهِيمَ فِي الْعَـٰلَمِينَ إِنَّكَ حَمِيدٌ مَّجِيدٌُ',
                ' Attahiyyaatul mubaarakaatush shalawaatuth thoyyibaatulillaah Assalaamu alaika ayyuhan nabiyyu warahmatullaahi wabarakaatuh Assalaamu alaina wa\'alaa ibaadillaahishaalihiin Asyhaduallaa ilaaha illallaah, wa asyhadu anna Muhammad Rasuulullaah. Allahumma shalli \'alaa sayyidinaa muhammad, Wa alaa aali sayyidina muhammad. Kamaa shallaita \n'
                'alaa sayyidinaa Ibraahim wa\'alaa aali sayyidinaa ibraahim, Wabaarik \'alaa sayyidinaa muhammad wa \'alaa aali sayyidina muhammad. Kamaa baarakta \'alaa sayyidinaa ibraahiim wa\'alaa aali sayyidina Ibraahiim fil\'aalamiina Innaka hamiidum majiid.',

                'Salam sejahtera bagi Allah, segala puji dan doa, serta keberkahan.\n'
                    'Salam sejahtera untukmu wahai Nabi, rahmat Allah dan berkah-Nya.\n'
                    'Salam sejahtera untuk kami dan bagi seluruh hamba Allah yang saleh.\n'
                    'Aku bersaksi tidak ada sesembahan yang berhak disembah kecuali Allah. Dan aku bersaksi bahwa Nabi Muhammad adalah utusan Allah. Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad. \n'
                    'Ya Allah. Limpahilah rahmat atas keluarga Nabi Muhammad. Sebagaimana pernah Engkau beri rahmat kepada Nabi Ibrahim dan keluarganya.\n'
                'Dan limpahilah berkah atas Nabi Muhammad beserta para keluarganya. Sebagaimana Engkau memberi berkah kepada Nabi Ibrahim dan keluarganya. Diseluruh alam semesta Engkaulah yang terpuji, dan Maha Mulia.'),
            _buildSection(
                'Salam Penutup (Setelah Tasyahhud)',
                'السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ',
                'Assalamu \'alaykum wa rahmatullahi wa barakatuhu',
                'Semoga keselamatan, rahmat Allah, dan keberkahan-Nya tercurah kepadamu.'),
          ],
        ),
      ),
    );
  }

  // Method untuk membangun tiap bagian bacaan dengan border biru dan panjang box yang sama
  Widget _buildSection(String title, String arab, String latin, String arti) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: double.infinity, // Membuat box lebar penuh
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2), // Pinggiran warna biru
          borderRadius: BorderRadius.circular(8), // Untuk membuat sudut melengkung
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              arab,
              style: TextStyle(fontSize: 14, fontFamily: 'Scheherazade'),
            ),
            SizedBox(height: 5),
            Text(
              latin,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              arti,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}



// Halaman Bacaan Salat Asar
class Bacaandoasehabissholat extends StatelessWidget {
  // Helper function to wrap text in a neat box
  Widget _buildSection(String title, String arab, String latin, String arti) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity, // This ensures the container extends to the full width
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue, width: 2), // Border color set to blue
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              arab,
              style: TextStyle(fontSize: 18, fontFamily: 'Scheherazade'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              latin,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              arti,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Doa Setelah Sholat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st Section with Box
              _buildSection(
                '1. Bacaan Doa Setelah Sholat',
                'أَسْتَغْفِرُ اللهَ الْعَظِـيْمِ الَّذِيْ لَااِلَهَ اِلَّا هُوَ الْحَيُّ الْقَيُّوْمُ وَأَتُوْبُ إِلَيْهِ',
                'Astaghfirullaha al-Azim, al-ladhi la ilaha illa Huwa, al-Hayyul-Qayyum wa atubu ilayh.',
                'Saya memohon ampunan kepada Allah yang Maha Agung, yang tidak ada Tuhan selain Dia, Yang Maha Hidup, Yang Maha Menjaga Kehidupan, dan saya bertaubat kepada-Nya.',
              ),
              SizedBox(height: 16),

              // 2nd Section with Box
              _buildSection(
                '2. Dilanjutkan dengan membaca:',
                'لَاإِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيْكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيِيْ وَيُمِيْتُ وَهُوَ عَلَى كُلِّ شَيْئٍ قَدِيْرٌ',
                'Laa ilaha illallah wahdahu laa syarika lahu, lahu al-mulku walahu al-hamdu yuhyi wa yumiitu wahuwa ‘ala kulli shai’in qadir.',
                'Tidak ada Tuhan selain Allah, Dia Maha Esa, tiada sekutu bagi-Nya, hanya bagi-Nya segala kerajaan dan segala pujian, Dia yang memberi hidup dan mematikan, dan Dia Maha Kuasa atas segala sesuatu.',
              ),
              SizedBox(height: 16),

              // 3rd Section with Box
              _buildSection(
                '3. Memohon perlindungan dari siksa neraka:',
                'اَللَّهُمَّ أَجِرْنِـى مِنَ النَّارِ',
                'Allahumma ajirni minan-naar (3x)',
                'Ya Allah, selamatkanlah aku dari siksa api neraka (diulang 3 kali).',
              ),
              SizedBox(height: 16),

              // 4th Section with Box
              _buildSection(
                '4. Memuji Allah dengan kalimat:',
                'اللَّهُمَّ أَنْتَ السَّلاَمُ، وَمِنْكَ السَّلَامُ، وَإِلَيْكَ يَعُوْدُ السَّلَامُ ...',
                'Allahumma anta as-salam, wa minka as-salam, wa ilayka ya’uddu as-salam ...',
                'Ya Allah, Engkau adalah Salam, dari-Mu lah Salam, dan kepada-Mu lah kembali Salam.',
              ),
              SizedBox(height: 16),

              // 5th Section with Box
              _buildSection(
                '5. Membaca Surat Al-Fatihah dan Ayat Kursi:',
                'أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ. بِسْمِ اللهِ الرَّحْمَنِ الرَّحِيمِ ...',
                'A’udhu billahi minash-shaytan ir-rajim. Bismillahir Rahmanir Rahim ...',
                'Aku berlindung kepada Allah dari godaan syaitan yang terkutuk. Dengan nama Allah yang Maha Pengasih lagi Maha Penyayang...',
              ),
              SizedBox(height: 16),

              // 6th Section with Box
              _buildSection(
                '6. Membaca Tasbih, Tahmid, Takbir, dan Tahlil:',
                'سُبْحَانَ اللهِ',
                'Subhanallah (33x)',
                'Maha Suci Allah (33x)',
              ),
              SizedBox(height: 8),
              _buildSection(
                '',
                'الْحَمْدُلِلهِ',
                'Alhamdulillah (33x)',
                'Segala puji bagi Allah (33x)',
              ),
              SizedBox(height: 8),
              _buildSection(
                '',
                'اللهُ اَكْبَرُ',
                'Allahu Akbar (33x)',
                'Allah Maha Besar (33x)',
              ),
              SizedBox(height: 8),
              _buildSection(
                '',
                'لَااِلٰهَ اِلَّا اللهُ',
                'La ilaha illallah (33x)',
                'Tiada Tuhan selain Allah (33x)',
              ),
              SizedBox(height: 16),

              // 7th Section with Box
              _buildSection(
                '7. Doa Setelah Sholat:',
                'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
                'Bismillahir Rahmanir Rahim',
                'Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang',
              ),
              SizedBox(height: 8),
              _buildSection(
                '',
                'اَلْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِيْنَ ...',
                'Alhamdulillahi rabbil alamin ...',
                'Segala puji bagi Allah, Tuhan semesta alam ...',
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}


// Halaman Bacaan Salat Maghrib
class Bacaandoadoapilihan extends StatelessWidget {
  // Helper function to wrap text in a neat box
  Widget _buildSection(String title, String arab, String latin, String arti) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity, // This ensures the container extends to the full width
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue, width: 2), // Border color set to blue
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              arab,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              latin,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              arti,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Doa Pilihan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doa 1
              _buildSection(
                '1. Doa Untuk Memulai Kebaikan',
                'اَللَّهُمَّ إِنِّي أَسْتَجِيرُ بِكَ مِنْ فِتْنَتِهِمْ',
                'Allahumma inni asta’idu bika min fitnatihim.',
                'Artinya: "Ya Allah, aku berlindung kepada-Mu dari fitnah mereka."',
              ),

              // Doa 2
              _buildSection(
                '2. Doa Memohon Perlindungan',
                'اَللَّهُمَّ اجْعَلْنِي فِي حِفْظِكَ وَرَعَايَتِكَ',
                'Allahumma ajilni fi hifzika wa ri’ayatik.',
                'Artinya: "Ya Allah, jadikan aku dalam penjagaan dan perawatan-Mu."',
              ),

              // Doa 3
              _buildSection(
                '3. Doa Mohon Keberkahan dalam Hidup',
                'اَللَّهُمَّ بَارِكْ لَنَا فِي رِزْقِنَا وَأَعْمَالِنَا',
                'Allahumma barik lana fi rizqina wa a’malina.',
                'Artinya: "Ya Allah, berkahilah rezeki dan amal kami."',
              ),

              // Doa 4
              _buildSection(
                '4. Doa Mohon Petunjuk dan Keberkahan',
                'اَللَّهُمَّ اجْعَلْنَا مِنَ الَّذِينَ يَسْتَمِعُونَ الْقَوْلَ',
                'Allahumma ajilna minal-ladhina yastami’unal-qawla.',
                'Artinya: "Ya Allah, jadikan kami termasuk orang-orang yang mendengarkan perkataan yang baik."',
              ),

              // Doa 5
              _buildSection(
                '5. Doa Ketika Menghadapi Kesulitan',
                'رَبِّ لَا تَذَرْنِي فَرْدًا وَأَنْتَ خَيْرُ الْوَارِثِينَ',
                'Rabbi la tazurni fardan wa anta khairul-warithin.',
                'Artinya: "Ya Tuhanku, janganlah Engkau tinggalkan aku sendirian dan Engkau adalah sebaik-baiknya pewaris."',
              ),

              // Doa 6
              _buildSection(
                '6. Doa Memohon Ampunan',
                'اَسْتَغْفِرُ اللَّهَ رَبِّي مِنْ كُلِّ ذَنْبٍ عَظِيمٍ',
                'Astaghfirullaha rabbi min kulli dzambin azim.',
                'Artinya: "Aku memohon ampun kepada Allah, Tuhan-ku, dari setiap dosa yang besar."',
              ),

              // Doa 7
              _buildSection(
                '7. Doa Mohon Kekuatan dan Kemenangan',
                'رَبِّ أَعِنِّي وَيُسِّرْ لِي فِي أَمْرِي',
                'Rabbi a’inni wa yassir li fi amri.',
                'Artinya: "Ya Tuhanku, bantulah aku dan permudahkanlah urusanku."',
              ),

              // Doa 8
              _buildSection(
                '8. Doa Untuk Menghindari Fitnah Dunia',
                'اَللَّهُمَّ اجْنِبْنَا فِتْنَةَ الدُّنْيَا وَعَذَابَ الْقَبْرِ',
                'Allahumma ajinnabna fitnatal-dunya wa adzabil-qabri.',
                'Artinya: "Ya Allah, jauhkan kami dari fitnah dunia dan azab kubur."',
              ),

              // Doa 9
              _buildSection(
                '9. Doa Memohon Keselamatan dan Kesehatan',
                'اللَّهُمَّ اجْعَلْنَا مِنْ أَهْلِ الْجَنَّةِ',
                'Allahumma ajilna min ahlil-jannah.',
                'Artinya: "Ya Allah, jadikan kami termasuk ahli surga."',
              ),

              // Doa 10
              _buildSection(
                '10. Doa Setelah Sholat',
                'اللَّهُمَّ تَقَبَّلْ مِنَّا',
                'Allahumma taqabbal minna.',
                'Artinya: "Ya Allah, terimalah amalan kami."',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Bacaan Salat Isya
class Bacaandoatahlil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BacaanPage(
      title: 'Bacaan Doa Tahlil',
      niat: 'لَا إِلٰهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ وَلَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
      artiNiat: 'Tiada Tuhan selain Allah, hanya Dia yang Maha Esa, tiada sekutu bagi-Nya, miliki-Nya lah segala kerajaan dan hanya bagi-Nya segala pujian, dan Dia Maha Kuasa atas segala sesuatu.',
      bacaan: 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ حَمْدًا يُوَافِي نِعْمَاهُ وَيُكَافِئُ مَزِيدَهُ يَا رَبَّنَا لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلاَلِ وَجْهِكَ وَعَظِيمِ سُلْطَانِكَ اللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِ سَيِّدِنَا مُحَمَّدٍ',
      artiBacaan: 'Bismillahirrahmaanirrahiim. Alhamdu lillaahi rabbil aalamiin, hamdan yuwaafii ni amahu wayukaafii maziidahu. Ya rabbanaa lakal hamdu kamaa yan baghhi lijalaali wajhika wa azhiimi sulthaanika. Allahumma shalli alaa sayyidinaa muhammadin wa alaa aali sayyidinaa muhammad. Artinya: Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Segala puji bagi Allah, Tuhan semesta alam, puji yang sesuai dengan ni’mat-Nya dan dapat membalas karunia-Nya. Ya Tuhan kami, hanya kepada-Mu segala pujian, sebagaimana yang layak bagi keagungan wajah-Mu dan kebesaran kerajaan-Mu. Ya Allah, curahkanlah shalawat kepada junjungan kami, Nabi Muhammad, dan kepada keluarga Nabi Muhammad.',
    );
  }
}

// Widget umum untuk menampilkan bacaan dan niat salat
class BacaanPage extends StatelessWidget {
  final String title;
  final String niat;
  final String artiNiat;
  final String bacaan;
  final String artiBacaan;

  BacaanPage({
    required this.title,
    required this.niat,
    required this.artiNiat,
    required this.bacaan,
    required this.artiBacaan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('Bacaan Tahlil', niat, artiNiat, true),
              SizedBox(height: 20),
              _buildSection('Doa', bacaan, artiBacaan, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String bacaan, String artiBacaan, bool isNiat) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background putih untuk niat
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.blue, width: 2), // Border biru
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            bacaan,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Artinya: $artiBacaan',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
