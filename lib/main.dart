import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const HinaApp());
}

class HinaApp extends StatelessWidget {
  const HinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: const BootPage(),
    );
  }
}

class BootPage extends StatefulWidget {
  const BootPage({super.key});

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  @override
  void initState() {
    super.initState();
    _decideNext();
  }

  Future<void> _decideNext() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('hina_username');

    if (!mounted) return;

    if (name != null && name.trim().isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ChatPage(userName: name.trim())),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _saving = false;

  Future<void> _enter() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    setState(() => _saving = true);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('hina_username', name);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ChatPage(userName: name)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Como a Hina deve te chamar?'),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _enter(),
              decoration: const InputDecoration(
                labelText: 'Seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: _saving ? null : _enter,
              child: _saving
                  ? const SizedBox(
                      width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String userName;
  const ChatPage({super.key, required this.userName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final List<_Msg> _msgs = [];
  bool _started = false;

  @override
  void initState() {
    super.initState();

    // Roda depois do primeiro frame, quando a tela já foi desenhada.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_started) {
        _started = true;
        _hinaFirstMessage();
      }
    });
  }

  void _hinaFirstMessage() {
    setState(() {
      _msgs.add(_Msg(
        fromHina: true,
        text: "Oii, ${widget.userName}! 💜 Como foi seu dia? Quer conversar sobre o quê?",
      ));
    });
  }

  void _sendUser() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _msgs.add(_Msg(fromHina: false, text: text));
    });
    _controller.clear();

    // Aqui depois a gente liga na API da Hina e adiciona a resposta dela.
    // Por enquanto, resposta fake:
    setState(() {
      _msgs.add(_Msg(fromHina: true, text: "Entendi, ${widget.userName}. Me conta mais 👀"));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hina - Oi, ${widget.userName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _msgs.length,
              itemBuilder: (context, i) {
                final m = _msgs[i];
                final align = m.fromHina ? Alignment.centerLeft : Alignment.centerRight;
                final color = m.fromHina ? Colors.purple.shade50 : Colors.blue.shade50;

                return Align(
                  alignment: align,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 520),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(m.text),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendUser(),
                    decoration: const InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendUser,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Msg {
  final bool fromHina;
  final String text;
  _Msg({required this.fromHina, required this.text});
}
