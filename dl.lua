-- ========== Settings ================
Settings:setCompareDimension(true, 1440)
Settings:setScriptDimension(true, 1440)
-- ==========  main program ===========
dialogInit()
addTextView("selecione uma das opçoes a baixo")
newRow()
addRadioGroup("rpt", 5)
addRadioButton("3", 3)
addRadioButton("5", 5)
addRadioButton("10", 10)
addRadioButton("20", 15)
addRadioButton("50", 15)
addRadioButton("ATE ESGOTAR", 0)

dialogShow("Configurações")

vezes = rpt

cont =0 

while(vezes == 0 or cont <= vezes) do

if(vezes==0) then
toast(cont.." de INFINITO")
else
toast(cont.." de "..vezes)
end

if(not existsClick("repeat.png",3000) or not existsClick("repeatBR.png",3000)) 
then
keyevent(3)
break
end
cont=cont+1
end
wait(3000)
keyevent(3)