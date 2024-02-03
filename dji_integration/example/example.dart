import 'package:dji_integration/dji_integration.dart';
import 'package:flutter/material.dart';

/// Esta classe em Flutter serve como uma demonstração de como usar os métodos
/// fornecidos pelo plugin 'dji_integration' para integrar funcionalidades de drones
/// DJI em um projeto Flutter.
///
/// ## Visão Geral
///
/// O aplicativo consiste em uma única tela com um widget de texto centralizado
/// exibindo as informações de versão recuperadas do plugin de Integração DJI.
/// O plugin é inicializado na classe [_MyHomePageState] durante seu método de ciclo de vida
/// [initState], e as informações de versão são exibidas no centro da tela usando um
/// widget [Text].
///
/// ## Dependências
///
/// As seguintes dependências são necessárias para este aplicativo:
/// - `dji_integration`: Um plugin Flutter personalizado projetado para integração com drones DJI.
/// - `flutter/material.dart`: O framework Flutter principal para construir componentes de IU.
///
/// ## Uso
///
/// Para usar este aplicativo, basta executá-lo em um dispositivo ou emulador compatível
/// com o Flutter. A tela principal exibirá as informações de versão recuperadas do drone DJI
/// usando o plugin 'dji_integration'.
///
/// ## Classes
///
/// ### 1. Classe `App`
/// - Um widget sem estado representando o aplicativo principal.
/// - Configura o MaterialApp com o modo de depuração desativado e define a tela inicial
///   como [MyHomePage].
///
/// ### 2. Classe `MyHomePage`
/// - Um widget com estado representando a tela inicial do aplicativo.
/// - Inicializa uma instância da classe [DjiIntegration] para lidar com a integração do drone DJI.
/// - Define a variável `versionApp` para armazenar as informações de versão recuperadas.
/// - Chama o método [_initState] durante o ciclo de vida [initState] para inicializar
///   o plugin e recuperar as informações de versão.
/// - Constrói a IU com um Scaffold contendo o corpo definido por [_body].
///
/// ### 3. Classe `_MyHomePageState`
/// - A classe de estado para [MyHomePage].
/// - Contém a lógica para inicializar o plugin de Integração DJI e recuperar
///   as informações de versão.
/// - Exibe as informações de versão no centro da tela.
///
/// ## Métodos Importantes
///
/// ### 1. Método `_initState`
/// - Inicializa o plugin de Integração DJI e recupera as informações de versão
///   usando o método [getPlatformVersion].
/// - Registra e estabelece uma conexão com o drone usando o método [initRegisterAndConnectionToDrone]
///   da instância [DjiIntegration].

void main () => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final djiIntegration = DjiIntegration();
  
  late String? versionApp;

  @override
  void initState() {
    _initState();
    super.initState();
  }

  Future<void> _initState () async {
    versionApp = await djiIntegration.getPlatformVersion();

    djiIntegration.initRegisterAndConnectionToDrone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body {
    return SafeArea(
      child: Center(
        child: Text(versionApp ?? ''),
      )
    );
  }
}