-- ========== Settings ================
Settings:setCompareDimension(true, 640)
Settings:setScriptDimension(true, 640)
-- ==========  main program ===========
dialogInit()
addTextView("selecione uma das opçoes a baixo")
newRow()
addRadioGroup("rpt", 5)
addRadioButton("3", 3)
addRadioButton("5", 5)
addRadioButton("10", 10)
addRadioButton("20", 15)
addRadioButton("50", 50)
addRadioButton("ATE ESGOTAR", 0)

dialogShow("Configurações v0.0.2")

vezes = rpt

cont =0 

right = Region(0,720, 640,130)

while(vezes == 0 or cont <= vezes) do

if(vezes==0) then
toast(cont.." de INFINITO")
else
toast(cont.." de "..vezes)
end

if(not existsClick("rpt-EN.png",3000) or not existsClick("rpt-BR.png",3000)) 
then
keyevent(3)
break
end
cont=cont+1
end
wait(3000)
keyevent(3)