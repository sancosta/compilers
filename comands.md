## Configurando o ANTLR4 no Linux (Fedora)

- Em modo **root** instale o java development kit.

        dnf install java-devel

- Vá até a pasta **/usr/local/lib**.

        cd /usr/local/lib

- Baixe o arquivo **antlr-4.5.3-complete.jar**.

        curl -O http://www.antlr.org/download/antlr-4.5.3-complete.jar

- Fora do modo root entre no arquivo **.bashrc**.

        nano ~/.bashrc

- No arquivo adicione as seguintes linha.

        export CLASSPATH=".:/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH"
        alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLSSPATH" org.antlr.v4.Tool'
        alias grun='java org.antlr.v4.gui.TestRig'
        source .bashrc

- Pronto ! Teste os comandos abaixo para verificar.

        env | grep CLASS
        javac nomearquivo*.java
        antlr4 nomearquivo.g4
        grun nomearquivo r -tree

- Dentro da pasta skeleton execute o comando **ant**, caso não esteja instalado, instale-o

        ant

- Dentro da pasta skeleton execute o comando abaixo para realizar os **testes léxicos**.

        java -jar dist/Compiler.jar -target scan -debug ../scanner/char1

- Dentro da pasta skeleton execute o comando abaixo para realizar os **testes de parser**.

        java -jar dist/Compiler.jar -target parse -debug ../parser/legal-01