CREATE FUNCTION dbo.PrimeiraLetraMaiuscula (@String VARCHAR(200))
RETURNS VARCHAR(200) --Escolha o tamanho que desejar
BEGIN 
	
	DECLARE @Maiusculo INT -- Variável responsável por determinar se o caracter deve ser maiúsculo (caso seu valor seja 1) ou minúsculo (caso seu valor seja 0).
	DECLARE @IndiceCaracter INT -- Variável responsável por Indicar o índice da string passada como parâmetro.
	DECLARE @Caracter CHAR(1) -- Variável responsável por armazenar o caracter específico contido na posição indicada pela variável @IndiceCaracter.
	DECLARE @FraseCompleta VARCHAR(200) -- Varíavel responsável por armazenar o conteúdo completo da frase passada como string já convertida.

	SET @Maiusculo = 1 -- A frase inicia com a primeira letra maiúscula
	SET @IndiceCaracter = 1 -- Por padrão, deve-se iniciar com 0, mas para haver sincronia com o valor LEN(@String), iniciei com 1.
		WHILE @IndiceCaracter <= LEN(@String) 
			BEGIN
				SET @Caracter =  SUBSTRING(@String,@IndiceCaracter,1) -- Irá obter o valor do caracter específico segundo o índice indicado por @IndiceCaracter

				IF @Caracter <> ' ' AND @Maiusculo = 1 -- Caso o valor de @Caracter seja diferente de ' ' e o valor de @Maiusculo seja igual a 1, o bloco if será executado.
					BEGIN
						SET @Caracter = UPPER(@Caracter) -- Seta o caracter para maiúsculo
						SET @Maiusculo = 0 -- Seta o valor de @Maiusculo para 0, informando que os próximos caracteres devem ser minúsculos até haver um espaço em branco.
						SET @FraseCompleta = CONCAT(@FraseCompleta,@Caracter) -- Concatena o valor de @Caracter com @FraseCompleta
					END
				ELSE -- Caso @Caracter = ' ', o bloco else será executado
					BEGIN
						SET @Caracter = LOWER(@Caracter) -- Seta o valor de @Caracter para um caracter minúsculo.
						SET @FraseCompleta = CONCAT(@FraseCompleta,@Caracter) -- Concatena o valor de @Caracter com @FraseCompleta
					END

				IF @Caracter = ' '
					BEGIN
						SET @Maiusculo = 1 -- Seta o valor de @Maiusculo para 1
					END
						
				SET @IndiceCaracter = @IndiceCaracter + 1 -- Seta o valor de @IndiceCaracter para += 1
			END
	RETURN @FraseCompleta -- Retorna a frase completa e formatada.
END
