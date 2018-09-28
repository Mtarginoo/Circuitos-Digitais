--Universidade Federal do Rio Grande do Norte
--
--Departamento de Engenharia de Computação e Automação
--
--Disciplina: DCA0212.1 - Circuitos Digitais - Laboratório
--
--Docente: EMANOEL RAIMUNDO QUEIROZ CHAVES JUNIOR 
--
--Autores: LOURIVAL ALEXANDRE DA CUNHA NETO -  2016012276
--         MATHEUS TARGINO BARBOSA - 20160152072
--         SAUL PEDRO MEDEIROS DE AZEVEDO - 2016010039
--
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;                 --habilitando os operadadores "+" e "-"

entity contador is                               --Definindo a entidade.
	port (clock, S, E, R: in std_logic;           --Variáveis para o clock, incremento/decrecmento(S), enable(E) e reset(R).
	q : buffer std_logic_vector(2 downto 0);      --Variável/vetor de saída do contador e entrada do decodificador. 
	saida  : out std_logic_vector (6 downto 0));  --Varíval/vetor de saída com os valores decodificados para o BCD de 7 segmentos.
end contador;

architecture comportamento of contador is        --Definindo a arquitetura.
		
		signal aux: std_logic_vector(2 downto 0);  --Variável de sinal auxiliar para o estado. 
		component dec7seg is                       --Incluindo o componente dec7seg (decodificador).
		port(s2, s1, s0 : in std_logic;            --Declarando as variáveis de entrada do dec7seg.
		a, b, c, d, e, f, g : out std_logic);      --Declarando as variáveis de saída do dec7seg. 
		end component;
		
		
begin
	process(clock, E, R, S)                      --Inicicando o process com as variáveis clock, E, R e S.
	begin      
		if(clock = '1' and clock'event) then      --Fazendo com que as mudanças de estado ocorram na transição de subida do clock.
 			if(E = '1') then                       --Casos para o enable ativado
				if(s = '1') then                    
					aux <= aux+1;                    --Somando +1, caso o incremento esteja ativado.
				else 
					aux <= aux-1;                    --Subtraindo 1, caso o dectremento esteja ativado. 
				end if;
			else
				if (R = '0') then                  --Caso o enable esteja desativado e o reset ativado
				aux <= "000";                      --Escrevemos 000 na variável auxiliar. 
				end if;
			end if;
				
		end if;
	end process;
	q <= aux;                                  --Atribuindo ao vetor q o valor de aux, ao final do processo.
	p1: dec7seg port map (q(2), q(1), q(0), saida(0), saida(1), saida(2), saida(3), saida(4), saida(5), saida(6)); --Fazendo o port map do decodificador com a saída do contador, juntamente com o vetor que armazena o estado dos leds do BCD 7 segmentos.
	
	
end comportamento;	