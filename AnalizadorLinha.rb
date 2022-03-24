class AnalisadorLinha
    attr_accessor :numero, :conteudo, :palavra, :freq

    def initialize(numero, conteudo)
        @numero = numero
        @conteudo = conteudo
        @palavra = Array.new 
        @freq = 1
    end

    def contaPalavras
        texto = conteudo.split(" ")
        tam = texto.length - 1
        aux2 = Array.new
        for i in 0..tam
            aux = texto[i]

            aux2 = texto.select{|a| a == aux}
            
            if aux2.length > freq 
                @palavra = Array.new
                if !palavra.include?(aux)             
                    @freq = aux2.length
                    @palavra.push(aux)
                end
            elsif aux2.length == freq
                if !palavra.include?(aux)             
                    @freq = aux2.length
                    @palavra.push(aux)
                end
            end
            
        end
    end
    def to_str
        self.contaPalavras
        return "Número da linha: #{@numero}\nConteúdo da linha: #{@conteudo}\nPalavra(s): #{@palavra}\nFrequência: #{@freq}\n\n"
    end
end


class Main
    
    arquivo = File.open("arquivo.txt")
    

    def self.analisaLinhas(texto)
        linhas = Array.new
        linhasAnalisadas = Array.new
        File.foreach(texto){|line| linhas.push(line)}

        for i in 1..texto.readlines.size
            linha = AnalisadorLinha.new(i, linhas[i-1])
            linhasAnalisadas.push(linha)
        end    
        return linhasAnalisadas    
    end

    linhasAnalisadas = analisaLinhas(arquivo)    
    linhasAnalisadas.each{|a| print a.to_str}

end

