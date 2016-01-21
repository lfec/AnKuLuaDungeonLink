function waitOneScan(zona, target)
t = Timer()
t:set()
	while (true) do
	if (zona:exists(target, 0)) then -- 0 is to scan once
		return zona:getLastMatch()
	end
	wait(10) -- wait one second, tune the scanrate here

	--toast(""..t:check())
	if(t:check()>=300) then
		return nil
	end
	
	end

end

function printToast(vezes, cont)

	if(vezes==0) then
		toast(cont.." de INFINITO")
	else
		toast(cont.." de "..vezes)
	end

end


-- ========== Settings ================
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)
-- ==========  main program ===========

linguas = {"EN", "BR"}

dialogInit()
addTextView("selecione uma das opçoes a baixo")
newRow()
addRadioGroup("rpt", 5)
addRadioButton("5", 5)
addRadioButton("10", 10)
addRadioButton("25", 25)
addRadioButton("50", 50)
addRadioButton("ATE ESGOTAR", 0)
newRow()
addSpinner("lng",linguas,linguas[1])
dialogShow("Configurações v0.0.3")

vezes = rpt
cont =1 
err = false

zona = Region(0,720, 640,130)
--zona:highlight()
button = Pattern("rpt-EN.png"):similar(0.95)
if(lgn=="BR") then
	button = Pattern("rpt-BR.png"):similar(0.95)
end

while(vezes == 0 or cont <= vezes) do

found = waitOneScan(zona, button)
found:highlight(2)
if(found == nil) then
	print("imagem não encontrada em 5 minutos")
	err = true
	return
else 
	click(found)
end

printToast(vezes, cont)

wait(60) -- tempo entre uma ação e outra

cont=cont+1
end

if(err) then
	keyevent(3) -- se houve erro, saia de vez
else
	wait(260) -- se não houve erro, espere 4 minutos para sair
	keyevent(3)
end
